import "package:auto_route/auto_route.dart";

import "app_router.gr.dart";
import "names.dart";

/// App router.
@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: RoutesNames.initial, initial: true),
    AutoRoute(page: PokemonListRoute.page, path: RoutesNames.home),
    AutoRoute(
      page: PokemonRoute.page,
      path: RoutesNames.pokemon,
    ),
  ];
}
