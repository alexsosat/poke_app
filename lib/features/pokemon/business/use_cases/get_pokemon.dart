import "package:flutter_common_classes/flutter_common_classes.dart";

import "../../data/models/params/pokemon_params.dart";
import "../entities/pokemon_entity.dart";
import "../repositories/pokemon_repository.dart";

/// Retrieves a pokemon details by ID
class GetPokemon extends UseCaseAsync<PokemonEntity, PokemonParams> {
  /// Retrieves a pokemon details by ID
  GetPokemon({required this.pokemonRepository});

  /// Repository instance
  final PokemonRepository pokemonRepository;

  @override
  Future<Either<Failure, PokemonEntity>> call({required PokemonParams params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
