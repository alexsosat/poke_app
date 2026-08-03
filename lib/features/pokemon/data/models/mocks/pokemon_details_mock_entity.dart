import "package:flutter_common_classes/constants/classes/mock_model.dart";

import "../../../business/enums/pokemon_types.dart";
import "../dtos/pokemon_details_model.dart";
import "pokemon_stats_mock_entity.dart";

/// Class that mocks the [PokemonDetailsModel] data class
class PokemonDetailsMock implements MockModel<PokemonDetailsModel> {
  /// Class that mocks the [PokemonDetailsModel] data class
  PokemonDetailsMock();

  @override
  PokemonDetailsModel mockData() => PokemonDetailsModel(
    height: 75,
    weight: 69,
    types: const [PokemonTypes.normal, PokemonTypes.normal],
    moves: const ["tackle", "vine whip"],
    description: "A small dinosaur-like Pokémon.",
    stats: PokemonStatsMock().mockData(),
  );
}
