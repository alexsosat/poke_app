import "package:flutter/material.dart";
import "package:flutter_common_classes/flutter_common_classes.dart";
import "package:shimmer/shimmer.dart";

import "../../../../core/constants/theme/app_separators.dart";
import "../../business/entities/pokemon_entity.dart";
import "../cubits/pokemon_infinite_list_cubit_2.dart";
import "pokemon_grid_card.dart";

/// Widget that showcase the pokemons in a grid view
class PokemonGridView extends StatefulWidget {
  /// Widget that showcase the pokemons in a grid view
  const PokemonGridView({required this.initialPokemons, super.key});

  /// Initial Pokemons to display in the grid view
  final List<PokemonEntity> initialPokemons;

  @override
  State<PokemonGridView> createState() => _PokemonGridViewState();
}

class _PokemonGridViewState extends State<PokemonGridView> {
  /// pokemons to display
  late List<PokemonEntity> pokemons;

  /// Scroll controller to manage the inifinite list
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    pokemons = widget.initialPokemons;
    scrollController = ScrollController()..addListener(fetchMorePokemons);
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(fetchMorePokemons)
      ..dispose();
    super.dispose();
  }

  /// function to fetch more pokemons when scrolling
  void fetchMorePokemons() {
    if (!scrollController.hasClients) {
      return;
    }
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= 80) {
      context.read<PokemonInfiniteListCubit2>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<PokemonInfiniteListCubit2, StateMixin<List<PokemonEntity>>>(
        listener: _gridListener,

        child: GridView.builder(
          controller: scrollController,
          itemCount: pokemons.length + 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            if (index == pokemons.length) {
              return _GridLoadingCard();
            }
            final pokemon = pokemons[index];
            return PokemonGridCard(pokemon: pokemon);
          },
        ),
      );

  void _gridListener(
    BuildContext context,
    StateMixin<List<PokemonEntity>> state,
  ) {
    if (state.status == WidgetStatus.success) {
      final cubitPokemons = context.read<PokemonInfiniteListCubit2>().pokemons;

      if (cubitPokemons.length != pokemons.length) {
        setState(() {
          pokemons = cubitPokemons;
        });
      }
    }
  }
}

class _GridLoadingCard extends StatelessWidget {
  const _GridLoadingCard();

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child:
        CubitWidgetStateBuilder<PokemonInfiniteListCubit2, List<PokemonEntity>>(
          onSuccess: (_) => const ShimmerGridCard(),
          onLoading: const ShimmerGridCard(),
          onFailure: (failure) => Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red, size: 24),
                Text(failure.title),
                AppSeparators.vSm,
                Text(failure.message),
              ],
            ),
          ),
        ),
  );
}

/// Loading Grid Card
class ShimmerGridCard extends StatelessWidget {
  /// Loading Grid Card
  const ShimmerGridCard({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.white,
    child: SizedBox(
      height: 100,
      width: 200,
      child: Container(color: Colors.red),
    ),
  );
}
