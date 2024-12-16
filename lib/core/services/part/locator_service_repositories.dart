part of '../locator_service.dart';

void _setupRepositories() {
  serviceLocator.registerLazySingleton<UserRepositoryInterface>(
    () => UserRepository(userService: serviceLocator<UserService>()),
  );

  serviceLocator.registerLazySingleton<UblogRepositoryInterface>(
    () => UblogRepository(ublogService: serviceLocator<UblogService>()),
  );

  serviceLocator.registerLazySingleton<AuthRepositoryInterface>(
    () => AuthRepository(authService: serviceLocator<AuthService>()),
  );

  serviceLocator.registerLazySingleton<PhotoRepositoryInterface>(
    () => PhotoRepository(photoService: serviceLocator<PhotoService>()),
  );

  serviceLocator.registerLazySingleton<DialogRepositoryInterface>(
    () => DialogRepository(dialogService: serviceLocator<DialogService>()),
  );
}
