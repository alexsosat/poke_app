import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_common_classes/flutter_common_classes.dart" hide Image;

import "../../../../core/gen/assets.gen.dart";
import "../../business/entities/pokemon_entity.dart";
import "../../data/models/mocks/pokemon_mock_entity.dart";
import "../cubits/pokemon_infinite_list_cubit.dart";
import "../cubits/pokemon_list_cubit.dart";
import "../widgets/pokemon_grid_filter_options.dart";
import "../widgets/pokemon_grid_view.dart";

/// Page that shows all the pokemons in a list style
@RoutePage()
class PokemonListPage
    extends PageLoaderWidget<PokemonListCubit, List<PokemonEntity>> {
  /// Page that shows all the pokemons in a list style
  const PokemonListPage({super.key});

  @override
  PokemonListCubit get mainCubit => PokemonListCubit();

  @override
  LoadingStyle get loadingStyle => SkeletonizerLoadingStyle(
    mockData: List.generate(9, (_) => PokemonMock().mockData()),
  );

  @override
  Widget? pageScaffold(Widget child) => Scaffold(
    appBar: AppBar(
      title: const Text("Pokédex"),
      centerTitle: false,
      leading: Padding(
        padding: const EdgeInsets.all(15),
        child: Hero(
          tag: "pokeball",
          child: Assets.images.pokeballWhite.image(),
        ),
      ),
      bottom: const PokemonGridFilterOptions(),
    ),
    body: Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4, top: 20),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: child,
        ),
      ),
    ),
  );

  @override
  Widget view(BuildContext context, List<PokemonEntity> data) => BlocProvider(
    create: (_) => PokemonInfiniteListCubit(
      data,
      context.read<PokemonListCubit>().params.limit,
      context.read<PokemonListCubit>().params.sort,
      context.read<PokemonListCubit>().params.search,
    ),
    child: PokemonGridView(initialPokemons: data),
  );
}
