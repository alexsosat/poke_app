// ignore_for_file: prefer_final_locals

import "package:flutter_common_classes/flutter_common_classes.dart";
import "package:get_it/get_it.dart";

import "../../business/entities/pokemon_entity.dart";
import "../../business/enums/list_sort_types_enum.dart";
import "../../business/use_cases/get_pokemon_list.dart";
import "../../data/models/params/pokemon_list_params.dart";

/// Cubit to handle the inifinite list
class PokemonInfiniteListCubit extends Cubit<StateMixin<List<PokemonEntity>>> {
  /// Cubit to handle the inifinite list
  PokemonInfiniteListCubit(
    List<PokemonEntity> initialData,
    int length,
    ListSortTypesEnum sort,
    String? search,
  ) : super(StateMixin.success(initialData)) {
    pokemons = initialData;
    params = PokemonListParams(
      offset: initialData.length,
      limit: length,
      sort: sort,
      search: search,
    );

    hasMore = initialData.length == length;
  }

  /// Logge r for the cubit
  final Logger logger = getLogger("Infinite List");

  /// params to fetch new pokemons
  late PokemonListParams params;

  /// Pokemon list
  late List<PokemonEntity> pokemons;

  /// Flag to check if there are more pokemons to load
  late bool hasMore;

  /// Load more pokemons
  Future<void> loadMore() async {
    logger.i("status: ${state.status}");
    if (state.status == WidgetStatus.loading ||
        state.status == WidgetStatus.failure ||
        !hasMore) {
      logger.i("skipped");
      return;
    }

    emit(StateMixin.loading());

    logger.i("offset: ${params.offset}");
    final result = await GetPokemonList(
      repository: GetIt.I.get(),
    ).call(params: params);

    Failure? failure;
    List<PokemonEntity> newData = List.from(pokemons);

    result.fold((f) => failure = f, (data) {
      logger.e("Data length: ${data.length} | params limit: ${params.limit}");
      if (data.isEmpty || data.length < params.limit) {
        logger.e("hasMore: false");
        hasMore = false;
      }
      newData.addAll(data);
    });

    if (failure != null) {
      logger.e(failure);
      emit(StateMixin.failure(failure!));
      return;
    }

    logger.i("data length: ${newData.length}");

    params = PokemonListParams(
      offset: newData.length,
      limit: params.limit,
      sort: params.sort,
      search: params.search,
    );
    pokemons = newData;

    logger.i("emitted");
    emit(StateMixin.success(newData));
  }

  /// Clears the error and loads more pokemons
  void retry() {
    emit(StateMixin<List<PokemonEntity>>.initial());
    loadMore();
  }

  /// Sets has more to false
  void noMorePokemons() {
    hasMore = false;
  }
}
