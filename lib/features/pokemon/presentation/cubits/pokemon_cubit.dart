import "package:flutter_common_classes/flutter_common_classes.dart";

import "../../business/entities/pokemon_entity.dart";

/// Cubit to handle the loading state of a pokemon information
class PokemonCubit extends AutoLoaderCubit<PokemonEntity> {
  /// Cubit to handle the loading state of a pokemon information
  PokemonCubit();

  @override
  Future<Either<Failure, PokemonEntity>> callUseCase() {
    // TODO: implement callUseCase
    throw UnimplementedError();
  }
}
