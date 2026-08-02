import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_common_classes/flutter_common_classes.dart" hide Image;

import "../../business/entities/pokemon_entity.dart";
import "../../data/models/mocks/pokemon_mock_entity.dart";
import "../cubits/pokemon_infinite_list_cubit_2.dart";
import "../cubits/pokemon_list_cubit.dart";
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
  Widget view(BuildContext context, List<PokemonEntity> data) => BlocProvider(
    create: (_) => PokemonInfiniteListCubit2(data, data.length),
    child: PokemonGridView(initialPokemons: data),
  );
}
