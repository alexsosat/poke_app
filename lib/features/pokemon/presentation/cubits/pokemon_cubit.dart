import "package:flutter_common_classes/flutter_common_classes.dart";
import "package:get_it/get_it.dart";

import "../../business/entities/pokemon_details_entity.dart";
import "../../business/use_cases/get_pokemon.dart";
import "../../data/models/params/pokemon_params.dart";

/// Cubit to handle the loading state of a pokemon information
class PokemonCubit extends AutoLoaderCubit<PokemonDetailsEntity> {
  /// Cubit to handle the loading state of a pokemon information
  PokemonCubit({required this.pokemonId});

  /// ID of the pokemon to retrieve details from
  final int pokemonId;

  @override
  Future<Either<Failure, PokemonDetailsEntity>> callUseCase() =>
      GetPokemon(pokemonRepository: GetIt.I.get()).call(
        params: PokemonParams(pokemonId),
      );
}
