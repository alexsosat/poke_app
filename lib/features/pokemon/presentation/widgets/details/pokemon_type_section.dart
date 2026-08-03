import "package:flutter/material.dart";
import "package:flutter_common_classes/extensions/string_extension.dart";
import "package:flutter_common_classes/extensions/theme_extension.dart";

import "../../../business/enums/pokemon_types.dart";

/// Section to show the pokemon types
class PokemonTypeSection extends StatelessWidget {
  /// Section to show the pokemon types
  const PokemonTypeSection({
    required this.types,
    super.key,
  });

  /// Types of the pokemon
  final List<PokemonTypes> types;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: types
        .map(
          (e) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: e.color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              e.name.toCapitalized(),
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        )
        .toList(),
  );
}
