import "package:flutter_common_classes/flutter_common_classes.dart";

import "../../../../core/errors/error_handler.dart";
import "../../business/entities/pokemon_details_entity.dart";
import "../../business/entities/pokemon_entity.dart";
import "../../business/repositories/pokemon_repository.dart";
import "../data_sources/remote/pokemon_remote_data_source.dart";
import "../models/params/pokemon_list_params.dart";
import "../models/params/pokemon_params.dart";

/// Data operations for the Pokemon collection
class PokemonRepositoryImpl implements PokemonRepository {
  /// Data operations for the Pokemon collection
  PokemonRepositoryImpl({required this.remoteDataSource});

  /// Remote source to fetch the information
  final PokemonRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<PokemonEntity>>> getPokemons({
    required PokemonListParams params,
  }) => ErrorHandler.handleApiCall(() async {
    final pokemons = await remoteDataSource.getPokemons(params: params);

    return pokemons.map((e) => e.toEntity()).toList();
  });

  @override
  Future<Either<Failure, PokemonDetailsEntity>> getPokemonDetails({
    required PokemonParams params,
  }) => ErrorHandler.handleApiCall(() async {
    final pokemonDetails = await remoteDataSource.getPokemonDetails(
      params: params,
    );

    return pokemonDetails.toEntity();
  });
}
