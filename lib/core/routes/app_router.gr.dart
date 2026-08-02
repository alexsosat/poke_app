// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:poke_app/features/pokemon/presentation/pages/pokemon_infinite_list_page.dart'
    as _i1;
import 'package:poke_app/features/pokemon/presentation/pages/pokemon_list_page.dart'
    as _i2;
import 'package:poke_app/features/pokemon/presentation/pages/pokemon_page.dart'
    as _i3;
import 'package:poke_app/features/splash/presentation/pages/splash_page.dart'
    as _i4;

/// generated route for
/// [_i1.PokemonInfiniteListPage]
class PokemonInfiniteListRoute extends _i5.PageRouteInfo<void> {
  const PokemonInfiniteListRoute({List<_i5.PageRouteInfo>? children})
    : super(PokemonInfiniteListRoute.name, initialChildren: children);

  static const String name = 'PokemonInfiniteListRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.PokemonInfiniteListPage();
    },
  );
}

/// generated route for
/// [_i2.PokemonListPage]
class PokemonListRoute extends _i5.PageRouteInfo<void> {
  const PokemonListRoute({List<_i5.PageRouteInfo>? children})
    : super(PokemonListRoute.name, initialChildren: children);

  static const String name = 'PokemonListRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.PokemonListPage();
    },
  );
}

/// generated route for
/// [_i3.PokemonPage]
class PokemonRoute extends _i5.PageRouteInfo<void> {
  const PokemonRoute({List<_i5.PageRouteInfo>? children})
    : super(PokemonRoute.name, initialChildren: children);

  static const String name = 'PokemonRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.PokemonPage();
    },
  );
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashPage();
    },
  );
}
