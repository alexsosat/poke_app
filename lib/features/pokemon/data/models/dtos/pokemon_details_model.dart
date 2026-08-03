import "../../../business/entities/pokemon_details_entity.dart";
import "../../../business/enums/pokemon_types.dart";
import "pokemon_stats_model.dart";

/// Model that transforms the PokemonDetails data from the API to the application
/// entity
class PokemonDetailsModel extends PokemonDetailsEntity {
  /// Model that transforms the PokemonDetails data from the API to the application
  /// entity
  const PokemonDetailsModel({
    required super.height,
    required super.weight,
    required super.types,
    required super.moves,
    required super.description,
    required super.stats,
  });

  /// Creates a PokemonDetails model from a map
  factory PokemonDetailsModel.fromMap({
    required Map<String, dynamic> map,
  }) => PokemonDetailsModel(
    height: (map["height"] as num).toDouble(),
    weight: (map["weight"] as num).toDouble(),
    types: (map["pokemon_v2_pokemontypes"] as List<dynamic>)
        .map(
          (e) => PokemonTypes.values.firstWhere(
            (type) =>
                type.name.toLowerCase() ==
                e["pokemon_v2_type"]["name"] as String,
            orElse: () => PokemonTypes.unknown, // Default fallback
          ),
        )
        .toList(),
    moves: (map["pokemon_v2_pokemonmoves"] as List<dynamic>)
        .map((e) => e["pokemon_v2_move"]["name"] as String)
        .toList(),
    description:
        (map["pokemon_v2_pokemonspecy"]["pokemon_v2_pokemonspeciesflavortexts"][0]["flavor_text"]
                as String)
            .replaceAll("\n", " "),
    stats: PokemonStatsModel.fromMapList(
      stats: map["pokemon_v2_pokemonstats"] as List<dynamic>,
    ),
  );

  /// Converts the model to an entity
  PokemonDetailsEntity toEntity() => PokemonDetailsEntity(
    height: height,
    weight: weight,
    types: types,
    moves: moves,
    description: description,
    stats: stats,
  );
}
