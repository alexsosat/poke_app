import "../../../business/entities/pokemon_stats_entity.dart";

/// Model that transforms the PokemonStats data from the API to the application
/// entity
class PokemonStatsModel extends PokemonStatsEntity {
  /// Model that transforms the PokemonStats data from the API to the application
  /// entity
  const PokemonStatsModel({
    required super.hp,
    required super.attack,
    required super.defense,
    required super.specialAttack,
    required super.specialDefense,
    required super.speed,
  });

  /// Creates a PokemonStats model from a map
  factory PokemonStatsModel.fromMap({
    required Map<String, dynamic> map,
  }) => PokemonStatsModel(
    hp: map["hp"] as int,
    attack: map["attack"] as int,
    defense: map["defense"] as int,
    specialAttack: map["special-attack"] as int,
    specialDefense: map["special-defense"] as int,
    speed: map["speed"] as int,
  );

  /// Creates a PokemonStats model from a list of maps
  ///
  /// This method is used to create a PokemonStats model from a list of maps
  /// that contains the pokemon stats
  factory PokemonStatsModel.fromMapList({
    required List<dynamic> stats,
  }) {
    final statsMap = <String, dynamic>{};
    for (final stat in stats) {
      statsMap[stat["pokemon_v2_stat"]["name"] as String] =
          stat["base_stat"] as int;
    }

    return PokemonStatsModel.fromMap(map: statsMap);
  }

  /// Converts the model to an entity
  PokemonStatsEntity toEntity() => PokemonStatsEntity(
    hp: hp,
    attack: attack,
    defense: defense,
    specialAttack: specialAttack,
    specialDefense: specialDefense,
    speed: speed,
  );
}
