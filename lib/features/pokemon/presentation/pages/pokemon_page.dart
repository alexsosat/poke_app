import "package:flutter/material.dart";
import "package:auto_route/auto_route.dart";

import "package:flutter_bloc/flutter_bloc.dart";

import "../cubits/pokemon_cubit.dart";

@RoutePage()
class PokemonPage extends StatelessWidget
{
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: BlocProvider(
        create: (context) => PokemonCubit(),
        child: Center(
          child: Text("Created with clean arq brick"),
        ),
      ),
    );
  }
}
