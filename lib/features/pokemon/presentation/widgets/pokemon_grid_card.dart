import "package:flutter/material.dart";
import "package:flutter_common_classes/flutter_common_classes.dart" hide Image;

import "../../../../core/extensions/int_extensions.dart";
import "../../business/entities/pokemon_entity.dart";

/// Card to showcase the pokemon on a grid display
class PokemonGridCard extends StatelessWidget {
  /// Card to showcase the pokemon on a grid display

  const PokemonGridCard({required this.pokemon, super.key});

  /// Pokemon entity data
  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) => Card(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Stack(
      children: [
        Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  pokemon.id.toPokedexId(),
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.theme.hintColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Image.network(pokemon.imageUrl, fit: BoxFit.contain),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(pokemon.name, style: context.textTheme.titleMedium),
              ),
            ),
          ],
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: context.theme.hintColor.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
                top: Radius.circular(10),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
