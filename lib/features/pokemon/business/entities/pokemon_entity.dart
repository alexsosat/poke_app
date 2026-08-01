import "package:equatable/equatable.dart";

/// Entity that contains the data of the Pokemon.
class PokemonEntity extends Equatable {
  /// Entity that contains the data of the Pokemon.
  const PokemonEntity({required this.id, required this.name});

  /// ID of the pokemon
  final int id;

  /// Name of the pokemon
  final String name;

  @override
  List<Object?> get props => [id, name];

  @override
  bool get stringify => true;
}
