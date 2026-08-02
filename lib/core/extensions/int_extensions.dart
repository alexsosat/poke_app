/// Extension for pokedex values
extension PokedexFormat on int {
  /// converts an int into a string following the pokedex formatting
  String toPokedexId() => '#${toString().padLeft(3, '0')}';
}
