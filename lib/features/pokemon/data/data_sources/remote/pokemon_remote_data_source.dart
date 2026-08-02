import "dart:convert";

import "../../../../../core/adapters/dio_adapter.dart";
import "../../models/dtos/pokemon_model.dart";
import "../../models/params/pokemon_list_params.dart";

/// Remote data source for the Pokemon collection
abstract class PokemonRemoteDataSource {
  /// Fetches the list of pokemons
  Future<List<PokemonModel>> getPokemons({required PokemonListParams params});
}

/// Remote data source for the Pokemon collection
class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  /// Remote data source for the Pokemon collection
  PokemonRemoteDataSourceImpl({required this.dio});

  /// Dio adapter instance
  final DioAdapter dio;

  @override
  Future<List<PokemonModel>> getPokemons({
    required PokemonListParams params,
  }) async {
    final response = await dio.post(
      "",
      data: jsonEncode({"query": params.graphQLQuery}),
    );

    if (response.data is! Map) {
      return [];
    } else if (response.data["data"]["pokemon_v2_pokemon"] is! List) {
      return [];
    }

    return (response.data["data"]["pokemon_v2_pokemon"] as List<dynamic>)
        .map((e) => PokemonModel.fromMap(map: e))
        .toList();
  }
}
