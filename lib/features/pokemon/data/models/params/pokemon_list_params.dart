import "package:flutter_common_classes/flutter_common_classes.dart";

/// Params to fetch the pokemon list api
class PokemonListParams extends Params {
  PokemonListParams({required this.offset, required this.limit});

  /// The pokemons to skip from the list
  final int offset;

  /// The number of pokemons to retrieve
  final int limit;

  @override
  Map<String, dynamic> queries() => {"offset": offset, "limit": limit};
}
