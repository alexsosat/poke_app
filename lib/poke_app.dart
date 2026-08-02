import "package:flutter/material.dart";
import "package:flutter_common_classes/localization/l10n.dart";
import "package:flutter_flavor/flutter_flavor.dart";

import "core/constants/theme/material_theme.dart";
import "core/constants/theme/util.dart";
import "core/routes/app_router.dart";

final _appRouter = AppRouter();

/// [PokeApp] is the entry point of the application.
class PokeApp extends StatelessWidget {
  /// [PokeApp] is the entry point of the application.
  const PokeApp({super.key});

  @override
  Widget build(BuildContext context) => FlavorBanner(
    child: MaterialApp.router(
      title: "PokeApp",
      debugShowCheckedModeBanner: false,

      //Theming
      themeMode: ThemeMode.light,
      theme: MaterialTheme(
        createTextTheme(context, "Jersey 10", "Jersey 10"),
      ).light(),
      darkTheme: MaterialTheme(
        createTextTheme(context, "Jersey 10", "Jersey 10"),
      ).dark(),

      localizationsDelegates: const [FlutterCommonLocalizations.delegate],

      routerConfig: _appRouter.config(),
    ),
  );
}
