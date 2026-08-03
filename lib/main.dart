import "package:device_preview_minus/device_preview_minus.dart";
import "package:flutter/material.dart";
import "package:flutter_common_classes/config/environment_config.dart"
    hide EnvironmentConfig;

import "core/config/dependency_injection.dart";
import "core/config/environment_config.dart";
import "poke_app.dart";

void main() async {
  EnvironmentConfig.init(flavor: Flavor.production);

  await DependencyInjection.injectCriticalServices();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const PokeApp(),
    ),
  );
}
