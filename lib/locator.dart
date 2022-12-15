import 'package:get_it/get_it.dart';
import 'package:linger/router/app_routes.gr.dart';
import 'package:linger/ui/Sunnat/FeedScreen.dart';
import 'data/data_repository/app_repository.dart';
import 'data/data_repository/app_repository_imple.dart';
import 'data/data_source/app_data_source_implementation.dart';
import 'services/app_json_store.dart';
import 'services/connectivity_service.dart';

import 'data/data_source/app_data_source.dart';
import 'services/http_services.dart';

final getItInjector = GetIt.instance;

void setupLocator() async {
  getItInjector.registerSingleton<ConnectivityService>(
    ConnectivityService('www.apple.com'),
  );

  getItInjector.registerSingleton<ApiProvider>(
    ApiProvider.instance(),
  );

  getItInjector.registerLazySingleton<AppJsonStore>(
    () => AppJsonStore.init(),
  );

  getItInjector.registerLazySingleton<AppDataSource>(
    () => AppDataSourceImple(
        apiProvider: getItInjector(), appJsonStore: getItInjector()),
  );

  getItInjector.registerLazySingleton<AppRepository>(
    () => AppRepositoryImple(
      connectivityService: getItInjector(),
      appDataSource: getItInjector(),
    ),
  );

  getItInjector.registerLazySingleton<AppRouter>(() => AppRouter());
  getItInjector.registerSingleton<FeedViewModel>(FeedViewModel());
}
