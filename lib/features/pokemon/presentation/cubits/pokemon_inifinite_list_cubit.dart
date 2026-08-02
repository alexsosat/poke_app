import "package:equatable/equatable.dart";
import "package:flutter_common_classes/flutter_common_classes.dart";
import "package:get_it/get_it.dart";

import "../../business/entities/pokemon_entity.dart";
import "../../business/use_cases/get_pokemon_list.dart";
import "../../data/models/params/pokemon_list_params.dart";

/// Represents the state of the infinite pokemon list.
class PokemonInfiniteListState extends Equatable {
  /// Constructor for [PokemonInfiniteListState].
  const PokemonInfiniteListState({
    this.status = WidgetStatus.initial,
    this.pokemons = const [],
    this.failure,
    this.isLoadingMore = false,
    this.loadMoreFailure,
    this.hasReachedMax = false,
    this.offset = 0,
    this.limit = 20,
  });

  /// The widget loading status.
  final WidgetStatus status;

  /// List of loaded pokemon entities.
  final List<PokemonEntity> pokemons;

  /// Initial or refresh load failure.
  final Failure? failure;

  /// Flag indicating if next page is loading.
  final bool isLoadingMore;

  /// Failure when loading more items.
  final Failure? loadMoreFailure;

  /// Flag indicating if the end of the list was reached.
  final bool hasReachedMax;

  /// Current pagination offset.
  final int offset;

  /// Pagination limit per request.
  final int limit;

  /// Creates a copy of [PokemonInfiniteListState] with modified fields.
  PokemonInfiniteListState copyWith({
    WidgetStatus? status,
    List<PokemonEntity>? pokemons,
    Failure? failure,
    bool? isLoadingMore,
    Failure? loadMoreFailure,
    bool? hasReachedMax,
    int? offset,
    int? limit,
    bool clearFailure = false,
    bool clearLoadMoreFailure = false,
  }) => PokemonInfiniteListState(
    status: status ?? this.status,
    pokemons: pokemons ?? this.pokemons,
    failure: clearFailure ? null : (failure ?? this.failure),
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    loadMoreFailure: clearLoadMoreFailure
        ? null
        : (loadMoreFailure ?? this.loadMoreFailure),
    hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    offset: offset ?? this.offset,
    limit: limit ?? this.limit,
  );

  @override
  List<Object?> get props => [
    status,
    pokemons,
    failure,
    isLoadingMore,
    loadMoreFailure,
    hasReachedMax,
    offset,
    limit,
  ];
}

/// Alias for [PokemonInfiniteListState] supporting spelling variations.
typedef PokemonInifiniteListState = PokemonInfiniteListState;

/// Cubit that manages the infinite scroll list of Pokemons with error handling.
class PokemonInfiniteListCubit extends Cubit<PokemonInfiniteListState> {
  /// Constructor for [PokemonInfiniteListCubit].
  PokemonInfiniteListCubit({
    GetPokemonList? getPokemonList,
    int limit = 20,
    bool autoFetch = true,
  }) : _getPokemonList =
           getPokemonList ?? GetPokemonList(repository: GetIt.I.get()),
       super(PokemonInfiniteListState(limit: limit)) {
    if (autoFetch) {
      fetchInitialPokemons();
    }
  }

  final GetPokemonList _getPokemonList;

  /// Fetches the initial page of pokemons or reloads from start.
  Future<void> fetchInitialPokemons() async {
    try {
      safeEmit(
        state.copyWith(
          status: WidgetStatus.loading,
          clearFailure: true,
          clearLoadMoreFailure: true,
        ),
      );

      final params = PokemonListParams(offset: 0, limit: state.limit);
      final result = await _getPokemonList.call(params: params);

      result.fold(
        (failure) => safeEmit(
          state.copyWith(status: WidgetStatus.failure, failure: failure),
        ),
        (pokemons) {
          if (pokemons.isEmpty) {
            safeEmit(
              state.copyWith(
                status: WidgetStatus.empty,
                pokemons: const [],
                hasReachedMax: true,
                offset: 0,
              ),
            );
          } else {
            safeEmit(
              state.copyWith(
                status: WidgetStatus.success,
                pokemons: pokemons,
                hasReachedMax: pokemons.length < state.limit,
                offset: pokemons.length,
              ),
            );
          }
        },
      );
    } catch (e) {
      safeEmit(
        state.copyWith(
          status: WidgetStatus.failure,
          failure: AppFailure.unexpected(e.toString()),
        ),
      );
    }
  }

  /// Fetches the next page of pokemons for infinite scroll.
  Future<void> fetchNextPage() async {
    if (state.isLoadingMore ||
        state.hasReachedMax ||
        state.status == WidgetStatus.loading) {
      return;
    }

    try {
      safeEmit(state.copyWith(isLoadingMore: true, clearLoadMoreFailure: true));

      final params = PokemonListParams(
        offset: state.offset,
        limit: state.limit,
      );
      final result = await _getPokemonList.call(params: params);

      result.fold(
        (failure) => safeEmit(
          state.copyWith(isLoadingMore: false, loadMoreFailure: failure),
        ),
        (newPokemons) {
          final updatedPokemons = List<PokemonEntity>.from(state.pokemons)
            ..addAll(newPokemons);
          final hasReachedMax =
              newPokemons.isEmpty || newPokemons.length < state.limit;
          final nextOffset = state.offset + newPokemons.length;

          safeEmit(
            state.copyWith(
              status: WidgetStatus.success,
              pokemons: updatedPokemons,
              isLoadingMore: false,
              hasReachedMax: hasReachedMax,
              offset: nextOffset,
            ),
          );
        },
      );
    } catch (e) {
      safeEmit(
        state.copyWith(
          isLoadingMore: false,
          loadMoreFailure: AppFailure.unexpected(e.toString()),
        ),
      );
    }
  }

  /// Refreshes the pokemon list from scratch.
  Future<void> refresh() async => fetchInitialPokemons();

  /// Retries fetching the next page after a pagination failure.
  Future<void> retryLoadMore() async => fetchNextPage();
}
