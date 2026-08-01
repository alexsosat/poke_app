import "package:flutter_common_classes/constants/classes/mock_model.dart";

import "../dtos/pokemon_model.dart";

/// Class that mocks the [PokemonModel] data class
class PokemonMock implements MockModel<PokemonModel> {
  /// Class that mocks the [PokemonModel] data class
  PokemonMock();

  @override
  PokemonModel mockData() => const PokemonModel(id: 1, name: "Pokemon");
}
