import "package:equatable/equatable.dart";

import "../enums/pokemon_types.dart";
import "pokemon_stats_entity.dart";

/// Entity that contains the PokemonDetails values.
class PokemonDetailsEntity extends Equatable {
  /// Entity that contains the PokemonDetails values.
  const PokemonDetailsEntity({
    required this.height,
    required this.weight,
    required this.types,
    required this.moves,
    required this.description,
    required this.stats,
  });

  /// Height in centimeters
  final double height;

  /// Weight in hectograms
  final double weight;

  /// List of types the pokemon has
  final List<PokemonTypes> types;

  /// Basic moves of the pokemon
  final List<String> moves;

  /// Pokemon description
  final String description;

  /// Pokemon Stats
  final PokemonStatsEntity stats;

  @override
  List<Object?> get props => [
    height,
    weight,
    types,
    moves,
    description,
    stats,
  ];

  @override
  bool get stringify => true;
}
