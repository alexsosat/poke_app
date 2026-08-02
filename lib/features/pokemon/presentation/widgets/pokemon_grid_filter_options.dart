import "package:flutter/material.dart";
import "package:flutter_common_classes/flutter_common_classes.dart";

import "../../../../core/constants/theme/app_separators.dart";
import "../cubits/pokemon_list_cubit.dart";
import "overlays/pokemon_list_sort_options_overlay.dart";

/// Options to filter the grid of pokemons
class PokemonGridFilterOptions extends StatefulWidget
    implements PreferredSizeWidget {
  /// Options to filter the grid of pokemons
  const PokemonGridFilterOptions({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  State<PokemonGridFilterOptions> createState() =>
      _PokemonGridFilterOptionsState();
}

class _PokemonGridFilterOptionsState extends State<PokemonGridFilterOptions> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: IntrinsicHeight(
      child: Row(
        children: [
          Expanded(child: _PokemonSearchTextField(_controller)),
          AppSeparators.hMd,
          const _PokemonListSortTypeButton(),
        ],
      ),
    ),
  );
}

class _PokemonListSortTypeButton extends StatelessWidget {
  const _PokemonListSortTypeButton();

  @override
  Widget build(BuildContext context) => IconButton(
    onPressed: () => _showSortOptions(context),
    icon: const Icon(Icons.filter_list),
    style: IconButton.styleFrom(
      foregroundColor: Colors.red,
      side: const BorderSide(color: Colors.red),
      backgroundColor: Colors.white,
    ),
  );

  Future _showSortOptions(BuildContext context) async {
    final cubit = context.read<PokemonListCubit>();

    final value = await showModalBottomSheet(
      context: context,
      builder: (overlayContext) => PokemonListSortOptionsOverlay(
        currentSort: cubit.params.sort,
      ),
    );

    if (value == null || !context.mounted) {
      return;
    }

    context.read<PokemonListCubit>().changePokemonSortType(value);
  }
}

class _PokemonSearchTextField extends StatelessWidget {
  const _PokemonSearchTextField(this.controller);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    decoration: const InputDecoration(
      filled: true,
      fillColor: Colors.white,
      prefixIcon: Icon(Icons.search, color: Colors.red),
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );
}
