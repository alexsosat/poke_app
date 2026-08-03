import "package:flutter/material.dart";
import "package:flutter_common_classes/extensions/string_extension.dart";
import "package:flutter_common_classes/extensions/theme_extension.dart";

import "../../../../../core/constants/theme/app_separators.dart";
import "../../../business/entities/pokemon_details_entity.dart";

/// Basic info section of the pokemon details page
class PokemonBasicInfo extends StatelessWidget {
  /// Basic info section of the pokemon details page
  const PokemonBasicInfo({
    required this.pokemonDetails,
    super.key,
  });

  /// Pokemon details entity
  final PokemonDetailsEntity pokemonDetails;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: _PokemonBasicValue(
          icon: Icons.scale_outlined,
          value: "${pokemonDetails.weight / 10} kg",
          label: "Weight",
        ),
      ),
      const VerticalDivider(
        width: 20,
      ),
      Expanded(
        child: _PokemonBasicValue(
          icon: Icons.height,
          value: "${pokemonDetails.height / 10} m",
          label: "Height",
        ),
      ),
      const VerticalDivider(
        width: 20,
      ),
      Expanded(
        child: _PokemonBasicValue(
          value: pokemonDetails.moves.map((e) => e.toCapitalized()).join("\n"),
          label: "Moves",
        ),
      ),
    ],
  );
}

class _PokemonBasicValue extends StatelessWidget {
  const _PokemonBasicValue({
    required this.value,
    required this.label,
    this.icon,
  });

  final IconData? icon;

  final String value;

  final String label;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon),
            if (icon != null) AppSeparators.hSm,
            Text(value),
          ],
        ),
      ),
      AppSeparators.vSm,
      Text(
        label,
        style: context.textTheme.bodySmall?.copyWith(
          color: context.colorScheme.outline,
        ),
      ),
    ],
  );
}
