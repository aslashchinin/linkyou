part of 'locator_service.dart';

void _setupViewModels() {
  // Top Users
  serviceLocator.registerFactory(
    () => UsersTopViewModel(
        repository: serviceLocator<UserRepositoryInterface>()),
  );

  // New Users
  serviceLocator.registerFactory(
    () => UsersNewViewModel(
        repository: serviceLocator<UserRepositoryInterface>()),
  );

  // Daily Users
  serviceLocator.registerFactory(
    () => UsersDailyViewModel(
        repository: serviceLocator<UserRepositoryInterface>()),
  );

  // Daily Cities Users
  serviceLocator.registerFactory(
    () => UsersDailyCitiesViewModel(
        repository: serviceLocator<UserRepositoryInterface>()),
  );

  // Login
  serviceLocator.registerFactory(
    () => FormLoginViewModel(
        repository: serviceLocator<AuthRepositoryInterface>()),
  );

  // User
  serviceLocator.registerFactory(
    () => UserViewModel(repository: serviceLocator<UserRepositoryInterface>()),
  );

  // User Photos
  serviceLocator.registerFactory(
    () => UserPhotoViewModel(
        repository: serviceLocator<PhotoRepositoryInterface>()),
  );

  // Gifts Slider
  serviceLocator.registerFactory(
    () => GiftsSliderViewModel(
        repository: serviceLocator<UserRepositoryInterface>()),
  );

  // Splash
  serviceLocator.registerFactory(
    () =>
        SplashViewModel(repository: serviceLocator<UserRepositoryInterface>()),
  );

  // Photo
  serviceLocator.registerFactory(
    () =>
        PhotoViewModel(repository: serviceLocator<PhotoRepositoryInterface>()),
  );

  // Photo Comments
  serviceLocator.registerFactory(
    () => PhotoCommentsViewModel(
        repository: serviceLocator<PhotoRepositoryInterface>()),
  );

  // Layout and Additional ViewModels
  serviceLocator.registerFactory(() => LayoutAppBarViewModel());
  serviceLocator.registerFactory(() => LayoutMenuViewModel());
  serviceLocator.registerFactory(() => AuthViewModel());
  serviceLocator.registerFactory(() => FormRegistrationViewModel());
  serviceLocator.registerFactory(() => FormPasswordRecoveryViewModel());
  serviceLocator.registerFactory(() => WelcomeViewModel());
}
