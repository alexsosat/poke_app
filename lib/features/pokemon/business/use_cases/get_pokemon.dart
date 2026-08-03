import "package:flutter_common_classes/flutter_common_classes.dart";

import "../../data/models/params/pokemon_params.dart";
import "../entities/pokemon_details_entity.dart";
import "../repositories/pokemon_repository.dart";

/// Retrieves a pokemon details by ID
class GetPokemon extends UseCaseAsync<PokemonDetailsEntity, PokemonParams> {
  /// Retrieves a pokemon details by ID
  GetPokemon({required this.pokemonRepository});

  /// Repository instance
  final PokemonRepository pokemonRepository;

  @override
  Future<Either<Failure, PokemonDetailsEntity>> call({
    required PokemonParams params,
  }) => pokemonRepository.getPokemonDetails(params: params);
}
