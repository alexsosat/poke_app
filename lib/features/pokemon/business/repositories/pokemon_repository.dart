import "package:flutter_common_classes/errors/failure.dart";
import "package:fpdart/fpdart.dart";

import "../../data/models/params/pokemon_list_params.dart";
import "../../data/models/params/pokemon_params.dart";
import "../entities/pokemon_details_entity.dart";
import "../entities/pokemon_entity.dart";

/// Data operations for the Pokemon collection
abstract class PokemonRepository {
  /// Retrieve the pokemon list
  Future<Either<Failure, List<PokemonEntity>>> getPokemons({
    required PokemonListParams params,
  });

  /// Retrieve a pokemon details
  Future<Either<Failure, PokemonDetailsEntity>> getPokemonDetails({
    required PokemonParams params,
  });
}
