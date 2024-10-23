import 'package:get_it/get_it.dart';
import 'package:linkyou/data/user/user_service.dart';
import 'package:linkyou/data/user/user_repository.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/views/blocks/top_users/top_users_viewmodel.dart';

final serviceLocator = GetIt.instance;

void setupTopUsersModule() {
  // Services
  if (!serviceLocator.isRegistered<UserService>()) {
    serviceLocator.registerLazySingleton(() => UserService());
  }

  // Repositories
  serviceLocator.registerLazySingleton<UserRepositoryInterface>(
    () => UserRepository(userService: serviceLocator<UserService>()),
  );

  // ViewModels
  serviceLocator.registerFactory(
    () => TopUsersViewModel(
        repository: serviceLocator<UserRepositoryInterface>()),
  );
}
