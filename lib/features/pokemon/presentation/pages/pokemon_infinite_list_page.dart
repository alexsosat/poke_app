import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_common_classes/flutter_common_classes.dart" hide Image;

import "../../business/entities/pokemon_entity.dart";
import "../cubits/pokemon_inifinite_list_cubit.dart";

/// Page displaying a list of pokemons with infinite scrolling and error handling.
@RoutePage()
class PokemonInfiniteListPage extends StatelessWidget {
  /// Page displaying a list of pokemons with infinite scrolling.
  const PokemonInfiniteListPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Pokemon Infinite List")),
    body: BlocProvider(
      create: (context) => PokemonInfiniteListCubit(),
      child: const _PokemonInfiniteListView(),
    ),
  );
}

/// Alias for [PokemonInfiniteListPage] supporting spelling variations.
typedef PokemonInifiniteListPage = PokemonInfiniteListPage;

/// View widget managing the scroll controller and infinite list state UI.
class _PokemonInfiniteListView extends StatefulWidget {
  const _PokemonInfiniteListView();

  @override
  State<_PokemonInfiniteListView> createState() =>
      _PokemonInfiniteListViewState();
}

class _PokemonInfiniteListViewState extends State<_PokemonInfiniteListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      return;
    }
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= 200) {
      context.read<PokemonInfiniteListCubit>().fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PokemonInfiniteListCubit, PokemonInfiniteListState>(
        builder: (context, state) {
          if (state.status == WidgetStatus.loading && state.pokemons.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == WidgetStatus.failure && state.pokemons.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.failure?.message ??
                          "An error occurred while loading pokemons",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => context
                          .read<PokemonInfiniteListCubit>()
                          .fetchInitialPokemons(),
                      icon: const Icon(Icons.refresh),
                      label: const Text("Retry"),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state.status == WidgetStatus.empty && state.pokemons.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search_off, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    "No pokemons found.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => context
                        .read<PokemonInfiniteListCubit>()
                        .fetchInitialPokemons(),
                    icon: const Icon(Icons.refresh),
                    label: const Text("Refresh"),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async =>
                context.read<PokemonInfiniteListCubit>().refresh(),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: state.hasReachedMax
                  ? state.pokemons.length
                  : state.pokemons.length + 1,
              itemBuilder: (context, index) {
                if (index >= state.pokemons.length) {
                  if (state.loadMoreFailure != null) {
                    return _LoadMoreErrorTile(
                      failure: state.loadMoreFailure!,
                      onRetry: () => context
                          .read<PokemonInfiniteListCubit>()
                          .retryLoadMore(),
                    );
                  }

                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final pokemon = state.pokemons[index];
                return _PokemonTile(pokemon: pokemon);
              },
            ),
          );
        },
      );
}

/// ListTile displaying an individual Pokemon's information.
class _PokemonTile extends StatelessWidget {
  const _PokemonTile({required this.pokemon});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    child: ListTile(
      leading: CircleAvatar(child: Image.network(pokemon.imageUrl)),
      title: Text(
        pokemon.name.toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text("#${pokemon.id}"),
      trailing: const Icon(Icons.chevron_right),
    ),
  );
}

/// Tile shown at the bottom of the list when loading next page fails.
class _LoadMoreErrorTile extends StatelessWidget {
  const _LoadMoreErrorTile({required this.failure, required this.onRetry});

  final Failure failure;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Text(
          "Error loading more pokemons: ${failure.message}",
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh),
          label: const Text("Tap to retry"),
        ),
      ],
    ),
  );
}
