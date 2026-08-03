import "package:flutter/material.dart";
import "package:flutter_common_classes/config/environment_config.dart";
import "package:flutter_flavor/flutter_flavor.dart";

/// A class that provides the environment configuration for the application.
///
/// This class is used to set the environment variables for the application.
class EnvironmentConfig {
  /// Key to access a resource of the environment.
  ///
  /// example: The key to access the api url.
  static const String apiUrlKey = "API_URL";

  /// Initializes the environment configuration.
  static void init({required Flavor flavor}) {
    FlavorConfig(
      name: flavor == Flavor.production ? null : flavor.name,
      color: Colors.red,
      location: BannerLocation.topStart,
      variables: _getVariables(flavor),
    );
  }

  static Map<String, dynamic> _getVariables(Flavor flavor) => switch (flavor) {
    Flavor.local => {},
    Flavor.test => {},
    Flavor.production => _prodVariables,
    Flavor.preProduction => {},
    Flavor.mock => {},
  };

  static const Map<String, dynamic> _prodVariables = {
    apiUrlKey: "https://beta.pokeapi.co/graphql/v1beta",
  };
}
