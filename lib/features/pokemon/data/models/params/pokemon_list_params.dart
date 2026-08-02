import "package:flutter_common_classes/flutter_common_classes.dart";

import "../../../business/enums/list_sort_types_enum.dart";

/// Params to fetch the pokemon list api
class PokemonListParams extends Params {
  /// Params to fetch the pokemon list api
  PokemonListParams({
    required this.offset,
    required this.limit,
    required this.sort,
  });

  /// The pokemons to skip from the list
  final int offset;

  /// The number of pokemons to retrieve
  final int limit;

  /// The sort type of the pokemon list
  final ListSortTypesEnum sort;

  @override
  Map<String, dynamic> queries() => {"offset": offset, "limit": limit};

  /// GraphQL query for pokemon graphQL endpoint
  String get graphQLQuery =>
      """
      query {
        pokemon_v2_pokemon(order_by: { ${sort.graphQLId}: asc }, limit: $limit, offset: $offset) {
          id
          name
        }
      }
    """;
}
