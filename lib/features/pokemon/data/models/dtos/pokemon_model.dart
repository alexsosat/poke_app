import "../../../business/entities/pokemon_entity.dart";

/// Model that transforms the Pokemon data from the API to the
/// application entity
class PokemonModel extends PokemonEntity {
  /// Model that transforms the Pokemon data from the API to the
  /// application entity
  const PokemonModel({required super.id, required super.name});

  /// Factory method to create a Pokemon model instance from a map
  factory PokemonModel.fromMap({
    required Map<String, dynamic> map,
    required int index,
  }) => PokemonModel(id: index, name: map["name"]);

  /// Factory method to create a Pokemon model instance from an
  /// entity
  factory PokemonModel.fromEntity({required PokemonEntity entity}) =>
      PokemonModel(id: entity.id, name: entity.name);

  /// Converts the Pokemon model instance to an entity
  PokemonEntity toEntity() => PokemonEntity(id: id, name: name);
}
