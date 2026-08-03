import "package:flutter/material.dart";
import "package:flutter_common_classes/flutter_common_classes.dart";

import "../../../../../core/constants/theme/app_separators.dart";
import "../../../business/entities/pokemon_details_entity.dart";
import "../../../business/entities/pokemon_entity.dart";
import "pokemon_basc_info_section.dart";
import "pokemon_stats_section.dart";
import "pokemon_type_section.dart";

/// Card to showcase all pokemon details
class PokemonDetailsCard extends StatelessWidget {
  /// Card to showcase all pokemon details
  const PokemonDetailsCard({
    required this.pokemonDetails,
    required this.pokemon,
    super.key,
  });

  /// Pokemon entity data
  final PokemonEntity pokemon;

  /// Pokemon details entity data
  final PokemonDetailsEntity pokemonDetails;

  @override
  Widget build(BuildContext context) => Card(
    child: ListView(
      padding: const EdgeInsets.symmetric(
        vertical: 60,
        horizontal: 20,
      ),
      children: [
        PokemonTypeSection(types: pokemonDetails.types),
        AppSeparators.vMd,
        Text(
          "About",
          textAlign: TextAlign.center,
          style: context.textTheme.headlineSmall?.copyWith(
            color: pokemon.color,
          ),
        ),
        AppSeparators.vSm,
        IntrinsicHeight(
          child: PokemonBasicInfo(pokemonDetails: pokemonDetails),
        ),
        AppSeparators.vLg,
        Text(pokemonDetails.description, textAlign: TextAlign.center),
        AppSeparators.vLg,
        Text(
          "Base Stats",
          textAlign: TextAlign.center,
          style: context.textTheme.headlineSmall?.copyWith(
            color: pokemon.color,
          ),
        ),
        AppSeparators.vSm,
        PokemonStatsSection(color: pokemon.color, stats: pokemonDetails.stats),
      ],
    ),
  );
}
