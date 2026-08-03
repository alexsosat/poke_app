import "package:auto_route/auto_route.dart";
import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_common_classes/flutter_common_classes.dart" hide Image;

import "../../../../core/extensions/int_extensions.dart";
import "../../../../core/routes/app_router.gr.dart";
import "../../business/entities/pokemon_entity.dart";
import "../cubits/pokemon_infinite_list_cubit.dart";

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
    child: InkWell(
      onTap: () => _onCardTap(context),
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
                child: Hero(
                  tag: pokemon.imageUrl,
                  child: CachedNetworkImage(
                    imageUrl: pokemon.imageUrl,
                    placeholder: (context, url) => Icon(
                      Icons.question_mark,
                      size: 50,
                      color: Colors.grey.shade500,
                    ),
                    fit: BoxFit.contain,
                    errorWidget: (context, error, stackTrace) => Icon(
                      Icons.question_mark,
                      size: 50,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    pokemon.name.toCapitalized(),
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium,
                  ),
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
    ),
  );

  void _onCardTap(BuildContext context) => context.router.push(
    PokemonRoute(
      key: ValueKey(pokemon.id),
      pokemon: pokemon,
      listCubit: context.read<PokemonInfiniteListCubit>(),
    ),
  );
}
