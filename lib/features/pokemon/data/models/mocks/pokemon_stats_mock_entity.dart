import "package:flutter_common_classes/constants/classes/mock_model.dart";

import "../dtos/pokemon_stats_model.dart";

/// Class that mocks the [PokemonStatsModel] data class
class PokemonStatsMock implements MockModel<PokemonStatsModel> {
  /// Class that mocks the [PokemonStatsModel] data class
  PokemonStatsMock();

  @override
  PokemonStatsModel mockData() => const PokemonStatsModel(
    hp: 45,
    attack: 49,
    defense: 49,
    specialAttack: 65,
    specialDefense: 65,
    speed: 45,
  );
}
