import "package:flutter_common_classes/flutter_common_classes.dart";
import "package:get_it/get_it.dart";

import "../../business/entities/pokemon_entity.dart";
import "../../business/use_cases/get_pokemon_list.dart";
import "../../data/models/params/pokemon_list_params.dart";

/// Cubit to handle the loading state of the pokemon list information
class PokemonListCubit extends AutoLoaderCubit<List<PokemonEntity>> {
  /// Cubit to handle the loading state of the pokemon list information
  PokemonListCubit();

  /// Params for the pokemon list
  PokemonListParams params = PokemonListParams(limit: 20, offset: 0);

  @override
  Future<Either<Failure, List<PokemonEntity>>> callUseCase() async =>
      GetPokemonList(repository: GetIt.I.get()).call(params: params);
}
