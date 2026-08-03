import "dart:convert";

import "package:flutter_common_classes/flutter_common_classes.dart";

import "../../../../../core/adapters/dio_adapter.dart";
import "../../models/dtos/pokemon_details_model.dart";
import "../../models/dtos/pokemon_model.dart";
import "../../models/params/pokemon_list_params.dart";
import "../../models/params/pokemon_params.dart";

/// Remote data source for the Pokemon collection
abstract class PokemonRemoteDataSource {
  /// Fetches the list of pokemons
  Future<List<PokemonModel>> getPokemons({required PokemonListParams params});

  /// Fetches the pokemon details
  Future<PokemonDetailsModel> getPokemonDetails({
    required PokemonParams params,
  });
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
    }

    final data = response.data as Map;

    if (data.containsKey("errors")) {
      final error = data["errors"][0] as Map;

      throw ClientErrorException.badRequest(
        message: error["message"],
      );
    }

    return (data["data"]["pokemon_v2_pokemon"] as List<dynamic>)
        .map((e) => PokemonModel.fromMap(map: e))
        .toList();
  }

  @override
  Future<PokemonDetailsModel> getPokemonDetails({
    required PokemonParams params,
  }) async {
    final response = await dio.post(
      "",
      data: jsonEncode({"query": params.graphQLQuery}),
    );

    if (response.data is! Map) {
      throw ClientErrorException.badRequest(
        message: "Error al obtener los datos del pokemon",
      );
    } else if (response.data["data"]["pokemon_v2_pokemon"] is! List) {
      throw ClientErrorException.badRequest(
        message: "Error al obtener los datos del pokemon",
      );
    }

    return PokemonDetailsModel.fromMap(
      map: (response.data["data"]["pokemon_v2_pokemon"] as List<dynamic>).first,
    );
  }
}
