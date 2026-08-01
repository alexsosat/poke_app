// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:poke_app/features/pokemon/presentation/pages/pokemon_list_page.dart'
    as _i1;
import 'package:poke_app/features/pokemon/presentation/pages/pokemon_page.dart'
    as _i2;
import 'package:poke_app/features/splash/presentation/pages/splash_page.dart'
    as _i3;

/// generated route for
/// [_i1.PokemonListPage]
class PokemonListRoute extends _i4.PageRouteInfo<void> {
  const PokemonListRoute({List<_i4.PageRouteInfo>? children})
    : super(PokemonListRoute.name, initialChildren: children);

  static const String name = 'PokemonListRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.PokemonListPage();
    },
  );
}

/// generated route for
/// [_i2.PokemonPage]
class PokemonRoute extends _i4.PageRouteInfo<void> {
  const PokemonRoute({List<_i4.PageRouteInfo>? children})
    : super(PokemonRoute.name, initialChildren: children);

  static const String name = 'PokemonRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.PokemonPage();
    },
  );
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashPage();
    },
  );
}
