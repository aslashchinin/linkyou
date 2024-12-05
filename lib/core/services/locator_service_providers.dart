part of 'locator_service.dart';

void _setupProviders() {
  if (!serviceLocator.isRegistered<AuthProvider>()) {
    serviceLocator.registerLazySingleton(() => AuthProvider());
  }
}

List<ChangeNotifierProvider> _getProvidersList() {
  return [
    _buildProvider<AuthProvider>(),
    _buildProvider<UsersTopViewModel>(),
    _buildProvider<WelcomeViewModel>(),
    _buildProvider<AuthViewModel>(),
    _buildProvider<FormRegistrationViewModel>(),
    _buildProvider<FormPasswordRecoveryViewModel>(),
    _buildProvider<LayoutMenuViewModel>(),
    _buildProvider<UsersNewViewModel>(),
    _buildProvider<UsersDailyViewModel>(),
    _buildProvider<UsersDailyCitiesViewModel>(),
    _buildProvider<FormLoginViewModel>(),
    _buildProvider<SplashViewModel>(),
    _buildProvider<UserViewModel>(),
    _buildProvider<UserPhotoViewModel>(),
    _buildProvider<GiftsSliderViewModel>(),
  ];
}

ChangeNotifierProvider<T> _buildProvider<T extends ChangeNotifier>() {
  return ChangeNotifierProvider<T>(
    create: (context) => serviceLocator<T>(),
  );
}
