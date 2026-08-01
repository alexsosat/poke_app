import "package:flutter_common_classes/flutter_common_classes.dart";

import "../../data/models/params/pokemon_list_params.dart";
import "../entities/pokemon_entity.dart";
import "../repositories/pokemon_repository.dart";

/// Use case for retrieving the pokemon list
class GetPokemonList
    extends UseCaseAsync<List<PokemonEntity>, PokemonListParams> {
  /// Use case for retrieving the pokemon list
  GetPokemonList({required this.repository});

  /// Pokemon repository
  final PokemonRepository repository;

  @override
  Future<Either<Failure, List<PokemonEntity>>> call({
    required PokemonListParams params,
  }) async => repository.getPokemons(params: params);
}
