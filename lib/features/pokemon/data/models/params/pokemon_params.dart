import "package:flutter_common_classes/constants/classes/params.dart";

/// Parameters used to make the Pokemon request.
class PokemonParams extends Params {
  /// Parameters used to make the Pokemon request.
  PokemonParams(
    this.id,
  );

  /// ID of the pokemon to fetch
  final int id;

  /// GraphQL query to fetch the pokemon details
  String get graphQLQuery =>
      """
   query{ pokemon_v2_pokemon(where: { id: { _eq: $id } }) {
          height
          weight
          pokemon_v2_pokemontypes(order_by: { slot: asc }) {
            pokemon_v2_type {
              name
            }
          }
          pokemon_v2_pokemonmoves(limit: 2) {
            pokemon_v2_move {
              name
            }
          }
          pokemon_v2_pokemonstats {
            base_stat
            pokemon_v2_stat {
              name
            }
          }
          pokemon_v2_pokemonspecy {
      pokemon_v2_pokemonspeciesflavortexts(
        where: { pokemon_v2_language: { name: { _eq: "en" } } }
        limit: 1
      ) {
        flavor_text
      }
    }
        }
        } """;
}
