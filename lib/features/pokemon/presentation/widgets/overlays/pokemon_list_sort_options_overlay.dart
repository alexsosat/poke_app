import "package:flutter/material.dart";

import "../../../business/enums/list_sort_types_enum.dart";

/// Bottomsheet to select the sort type of the pokemon list
class PokemonListSortOptionsOverlay extends StatelessWidget {
  /// Bottomsheet to select the sort type of the pokemon list
  const PokemonListSortOptionsOverlay({required this.currentSort, super.key});

  /// The current sort type of the pokemon list
  final ListSortTypesEnum currentSort;

  @override
  Widget build(BuildContext context) => RadioGroup(
    groupValue: currentSort,
    onChanged: (option) {
      if (currentSort == option) {
        return;
      }

      Navigator.of(context).pop(option);
    },
    child: ListView(
      children: ListSortTypesEnum.values
          .map(
            (option) => RadioListTile(
              value: option,
              title: Text(option.displayName),
              secondary: Icon(option.icon),
            ),
          )
          .toList(),
    ),
  );
}
