import "dart:convert";

import "../../../business/entities/pokemon_entity.dart";

/// Model that transforms the Pokemon data from the API to the
/// application entity
class PokemonModel extends PokemonEntity {
  /// Model that transforms the Pokemon data from the API to the
  /// application entity
  const PokemonModel();

  

  /// Factory method to create a Home model instance from a JSON
  factory PokemonModel.fromJson({required String json}) => PokemonModel.fromMap(map: jsonDecode(json));

  /// Factory method to create a Pokemon model instance from a map
  factory PokemonModel.fromMap({required Map<String, dynamic> map}) =>
     const PokemonModel();

  /// Factory method to create a Pokemon model instance from an 
  /// entity
  factory PokemonModel.fromEntity({required PokemonEntity entity}) => PokemonModel();

  /// Converts the Pokemon model instance to a map
  Map<String, dynamic> toMap() => {};

  /// Converts the Home model instance to a JSON
  String toJson() => jsonEncode(toMap());
  
  /// Converts the Pokemon model instance to an entity
  PokemonEntity toEntity() => PokemonEntity();
}
