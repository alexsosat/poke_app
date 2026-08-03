// ignore_for_file: public_member_api_docs

import "package:flutter/material.dart";

import "../../../../core/extensions/string_to_pokemon_color_extension.dart";

/// All pokemon types
enum PokemonTypes {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  unknown,
}

/// Extension for [PokemonTypes]
extension PokemonTypeExtension on PokemonTypes {
  /// Color of the pokemon type
  Color get color => name.toTypeColor();
}
