import 'package:get_it/get_it.dart';

import 'data/remote/remote.dart';

GetIt locator = GetIt.instance;

setUpLocator() {
  // * Register Instance of AuthService for Global Use in the application.
  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());
}
