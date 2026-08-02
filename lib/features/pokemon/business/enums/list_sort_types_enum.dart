import "package:flutter/material.dart";

/// Enum to categorize the different types of sortings of the pokemon list
enum ListSortTypesEnum {
  /// Sorts the pokemons by their names
  alphabetical(graphQLId: "name"),

  /// Sorts the pokemons by their number id
  id(graphQLId: "id");

  const ListSortTypesEnum({required this.graphQLId});

  /// The id to use for the graphql query
  final String graphQLId;
}

/// Extension for [ListSortTypesEnum]
extension ListSortTypeExtension on ListSortTypesEnum {
  /// Display name of the sort type
  String get displayName {
    switch (this) {
      case ListSortTypesEnum.alphabetical:
        return "Alphabetical";
      case ListSortTypesEnum.id:
        return "Id";
    }
  }

  /// Icon of the sort type
  IconData get icon {
    switch (this) {
      case ListSortTypesEnum.alphabetical:
        return Icons.abc;
      case ListSortTypesEnum.id:
        return Icons.numbers;
    }
  }
}
