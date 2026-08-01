import "package:fpdart/fpdart.dart";

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
    final response = await dio.get(
      "/pokemon",
      queryParameters: params.queries(),
    );

    if (response.data is! Map) {
      return [];
    } else if (response.data["results"] is! List) {
      return [];
    }

    return (response.data["results"] as List<dynamic>)
        .mapWithIndex((e, i) => PokemonModel.fromMap(map: e, index: i + 1))
        .toList();
  }
}
