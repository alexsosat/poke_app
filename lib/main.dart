import "package:flutter/material.dart";
import "package:flutter_common_classes/config/environment_config.dart"
    hide EnvironmentConfig;

import "core/config/dependency_injection.dart";
import "core/config/environment_config.dart";
import "poke_app.dart";

void main() async {
  EnvironmentConfig.init(flavor: Flavor.production);

  await DependencyInjection.injectCriticalServices();

  runApp(const PokeApp());
}
