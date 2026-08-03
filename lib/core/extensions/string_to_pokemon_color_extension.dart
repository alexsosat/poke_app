import "package:flutter/material.dart";

/// Extension to convert a pokemon type string to its corresponding color
extension PokemonTypeColor on String {
  /// Converts a pokemon type string to its corresponding color
  Color toTypeColor() {
    switch (toLowerCase()) {
      case "grass":
        return const Color(0xFF71c558);
      case "fire":
        return const Color(0xFFea7a3c);
      case "water":
        return const Color(0xFF539ae2);
      case "electric":
        return const Color(0xFFe5c531);
      case "poison":
        return const Color(0xFFb468b7);
      case "bug":
        return const Color(0xFF94bc4a);
      case "normal":
        return const Color(0xFFaab09f);
      case "ground":
        return const Color(0xFFcc9f4f);
      case "fairy":
        return const Color(0xFFe397d1);
      case "fighting":
        return const Color(0xFFcb5f48);
      case "psychic":
        return const Color(0xFFe5709b);
      case "rock":
        return const Color(0xFFb2a061);
      case "ghost":
        return const Color(0xFF846ab6);
      case "ice":
        return const Color(0xFF70cbd4);
      case "dragon":
        return const Color(0xFF6a7baf);
      case "dark":
        return const Color(0xFF736c75);
      case "steel":
        return const Color(0xFF89a1b0);
      case "flying":
        return const Color(0xFF7da6de);
      default:
        return const Color(0xFFaab09f); // Default fallback (Normal type color)
    }
  }
}
