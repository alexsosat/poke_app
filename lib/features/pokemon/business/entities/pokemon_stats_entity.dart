import "package:equatable/equatable.dart";

/// Entity that contains the PokemonStats values.
class PokemonStatsEntity extends Equatable {
  /// Entity that contains the PokemonStats values.
  const PokemonStatsEntity({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  /// Health points
  final int hp;

  /// Attack points
  final int attack;

  /// Defense points
  final int defense;

  /// Special attack points
  final int specialAttack;

  /// Special defense points
  final int specialDefense;

  /// Speed points
  final int speed;

  @override
  List<Object?> get props => [
    hp,
    attack,
    defense,
    specialAttack,
    specialDefense,
    speed,
  ];

  @override
  bool get stringify => true;
}
