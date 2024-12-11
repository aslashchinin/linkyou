part of 'locator_service.dart';

void _setupProviders() {
  if (!serviceLocator.isRegistered<AuthProvider>()) {
    serviceLocator.registerLazySingleton(() => AuthProvider());
  }
  if (!serviceLocator.isRegistered<SocketProvider>()) {
    serviceLocator.registerLazySingleton(() => SocketProvider());
  }
}

List<ChangeNotifierProvider> _getProvidersList() {
  return [
    _buildProvider<AuthProvider>(),
    _buildProvider<SocketProvider>(),
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
    _buildProvider<PhotoViewModel>(),
    _buildProvider<PhotoCommentsViewModel>(),
    _buildProvider<DialogViewModel>(),
    _buildProvider<DialogMessagesViewModel>(),
  ];
}

ChangeNotifierProvider<T> _buildProvider<T extends ChangeNotifier>() {
  return ChangeNotifierProvider<T>(
    create: (context) => serviceLocator<T>(),
  );
}
