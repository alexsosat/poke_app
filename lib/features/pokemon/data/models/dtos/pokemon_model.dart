import "../../../../../core/extensions/string_to_pokemon_color_extension.dart";
import "../../../business/entities/pokemon_entity.dart";

/// Model that transforms the Pokemon data from the API to the
/// application entity
class PokemonModel extends PokemonEntity {
  /// Model that transforms the Pokemon data from the API to the
  /// application entity
  const PokemonModel({
    required super.id,
    required super.name,
    required super.color,
  });

  /// Factory method to create a Pokemon model instance from a map
  factory PokemonModel.fromMap({required Map<String, dynamic> map}) =>
      PokemonModel(
        id: map["id"],
        name: map["name"],
        color:
            (map["pokemon_v2_pokemontypes"][0]["pokemon_v2_type"]["name"]
                    as String)
                .toTypeColor(),
      );

  /// Factory method to create a Pokemon model instance from an
  /// entity
  factory PokemonModel.fromEntity({required PokemonEntity entity}) =>
      PokemonModel(
        id: entity.id,
        name: entity.name,
        color: entity.color,
      );

  /// Converts the Pokemon model instance to an entity
  PokemonEntity toEntity() => PokemonEntity(id: id, name: name, color: color);
}
