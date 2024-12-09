part of 'locator_service.dart';

void _setupServices() {
  _registerServiceIfNotExists<UserService>(
    () => UserService(authProvider: serviceLocator<AuthProvider>()),
  );

  _registerServiceIfNotExists<UblogService>(
    () => UblogService(authProvider: serviceLocator<AuthProvider>()),
  );

  _registerServiceIfNotExists<AuthService>(
    () => AuthService(authProvider: serviceLocator<AuthProvider>()),
  );

  _registerServiceIfNotExists<PhotoService>(
    () => PhotoService(authProvider: serviceLocator<AuthProvider>()),
  );

  _registerServiceIfNotExists<DialogService>(
    () => DialogService(authProvider: serviceLocator<AuthProvider>()),
  );
}

void _registerServiceIfNotExists<T extends Object>(
    T Function() serviceCreator) {
  if (!serviceLocator.isRegistered<T>()) {
    serviceLocator.registerLazySingleton(serviceCreator);
  }
}
