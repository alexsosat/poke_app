import "package:auto_route/auto_route.dart";
import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_common_classes/flutter_common_classes.dart" hide Image;

import "../../../../core/constants/theme/app_separators.dart";
import "../../../../core/extensions/int_extensions.dart";
import "../../../../core/gen/assets.gen.dart";
import "../../business/entities/pokemon_details_entity.dart";
import "../../business/entities/pokemon_entity.dart";
import "../../data/models/mocks/pokemon_details_mock_entity.dart";
import "../cubits/pokemon_cubit.dart";
import "../widgets/details/pokemon_details_card.dart";

/// Page to show all pokemon details
@RoutePage()
class PokemonPage extends PageLoaderWidget<PokemonCubit, PokemonDetailsEntity> {
  /// Page to show all pokemon details
  const PokemonPage({
    required this.pokemon,
    super.key,
  });

  /// ID of the pokemon to retrieve details from
  final PokemonEntity pokemon;

  @override
  PokemonCubit get mainCubit => PokemonCubit(pokemonId: pokemon.id);

  @override
  LoadingStyle get loadingStyle => SkeletonizerLoadingStyle(
    mockData: PokemonDetailsMock().mockData(),
  );

  @override
  Widget? pageScaffold(Widget child) => Scaffold(
    backgroundColor: pokemon.color,

    body: SafeArea(
      bottom: false,
      child: Stack(
        children: [
          _PokemonHeader(pokemon: pokemon),
          child,
          Align(
            alignment: const FractionalOffset(0.5, 0.390),
            child: FractionalTranslation(
              translation: const Offset(0, -0.5),
              child: CachedNetworkImage(
                imageUrl: pokemon.imageUrl,
                height: 200,
              ),
            ),
          ),
        ],
      ),
    ),
  );

  @override
  Widget view(BuildContext context, PokemonDetailsEntity data) => Column(
    children: [
      Expanded(
        flex: 1,
        child: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Opacity(
              opacity: 0.2,
              child: Assets.images.pokeballWhite.image(),
            ),
          ),
        ),
      ),
      AppSeparators.vSm,
      Expanded(
        flex: 2,
        child: PokemonDetailsCard(
          pokemon: pokemon,
          pokemonDetails: data,
        ),
      ),
    ],
  );
}

class _PokemonHeader extends StatelessWidget {
  const _PokemonHeader({
    required this.pokemon,
  });

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const BackButton(
        color: Colors.white,
      ),
      Expanded(
        child: Text(
          pokemon.name.toCapitalized(),
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Text(
          pokemon.id.toPokedexId(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
