import "package:flutter/material.dart";
import "package:flutter_common_classes/services/connection/network_info.dart";
import "package:flutter_flavor/flutter_flavor.dart";
import "package:get_it/get_it.dart";

import "../../features/pokemon/business/repositories/pokemon_repository.dart";
import "../../features/pokemon/data/data_sources/remote/pokemon_remote_data_source.dart";
import "../../features/pokemon/data/repositories/pokemon_repository_impl.dart";
import "../adapters/dio_adapter.dart";
import "environment_config.dart";

/// Class to inject the dependencies in the application
class DependencyInjection {
  /// Inject the services in the application
  static Future<void> injectCriticalServices() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  /// Initialize the services in the application
  static Future<void> injectServices() async {}

  /// Inject the repositories in the application
  ///
  /// This injects the repositories when the application is running
  /// These repositories are loaded during the splash screen
  static Future<void> injectRepositories() async {
    final env = FlavorConfig.instance.variables;

    final internetInfo = NetworkInfoImpl(InternetConnection());

    final dio = DioAdapter(
      internetInfo: internetInfo,
      baseUrl: env[EnvironmentConfig.apiUrlKey],
    );

    GetIt.I.registerSingleton<PokemonRepository>(
      PokemonRepositoryImpl(
        remoteDataSource: PokemonRemoteDataSourceImpl(dio: dio),
      ),
    );
  }
}
