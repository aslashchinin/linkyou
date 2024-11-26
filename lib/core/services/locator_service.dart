import 'package:get_it/get_it.dart';
import 'package:linkyou/data/user/user_service.dart';
import 'package:linkyou/data/user/user_repository.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/views/blocks/users_top/users_top_viewmodel.dart';
import 'package:linkyou/views/blocks/users_new/users_new_viewmodel.dart';
import 'package:linkyou/views/blocks/users_daily/users_daily_viewmodel.dart';
import 'package:linkyou/views/blocks/users_daily_cities/users_daily_cities_viewmodel.dart';
import 'package:linkyou/views/blocks/form_login/form_login_viewmodel.dart';
import 'package:linkyou/views/screens/user/user_viewmodel.dart';
import 'package:linkyou/views/blocks/user_photos/user_photo_viewmodel.dart';
import 'package:linkyou/views/blocks/gifts_slider/gifts_slider_viewmodel.dart';
import 'package:linkyou/views/screens/splash/splash_viewmodel.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:linkyou/data/ublog/ublog_repository_interface.dart';
import 'package:linkyou/data/ublog/ublog_service.dart';
import 'package:linkyou/data/ublog/ublog_repository.dart';

final serviceLocator = GetIt.instance;

void setupTopUsersModule() {  
  if (!serviceLocator.isRegistered<AuthProvider>()) {
    serviceLocator.registerLazySingleton(() => AuthProvider());
  }

  if (!serviceLocator.isRegistered<UserService>()) {
    serviceLocator.registerLazySingleton(() => UserService(authProvider: serviceLocator<AuthProvider>()));
  }

  if (!serviceLocator.isRegistered<UblogService>()) {
    serviceLocator.registerLazySingleton(
        () => UblogService(authProvider: serviceLocator<AuthProvider>()));
  }

  serviceLocator.registerLazySingleton<UserRepositoryInterface>(
    () => UserRepository(userService: serviceLocator<UserService>()),
  );
  serviceLocator.registerLazySingleton<UblogRepositoryInterface>(
    () => UblogRepository(ublogService: serviceLocator<UblogService>()),
  );
  serviceLocator.registerFactory(
    () => UsersTopViewModel(
        repository: serviceLocator<UserRepositoryInterface>()),
  );
  serviceLocator.registerFactory(
    () => UsersNewViewModel(
        repository: serviceLocator<UserRepositoryInterface>()),
  );
  serviceLocator.registerFactory(
    () => UsersDailyViewModel(
        repository: serviceLocator<UserRepositoryInterface>()),
  );
  serviceLocator.registerFactory(
    () => UsersDailyCitiesViewModel(
        repository: serviceLocator<UserRepositoryInterface>()),
  );
  serviceLocator.registerFactory(
    () => FormLoginViewModel(repository: serviceLocator<UserRepositoryInterface>()),
  );
  serviceLocator.registerFactory(
    () => UserViewModel(repository: serviceLocator<UserRepositoryInterface>()),
  );
  serviceLocator.registerFactory(
    () => UserPhotoViewModel(repository: serviceLocator<UserRepositoryInterface>()),
  );
  serviceLocator.registerFactory(
    () => GiftsSliderViewModel(repository: serviceLocator<UserRepositoryInterface>()),
  );
  serviceLocator.registerFactory(
    () =>
        SplashViewModel(repository: serviceLocator<UserRepositoryInterface>()),
  );
}
