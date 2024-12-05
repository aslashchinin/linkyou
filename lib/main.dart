import 'package:flutter/material.dart';
import 'package:linkyou/views/blocks/users_top/users_top_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:linkyou/core/services/route_service.dart';
import 'package:linkyou/views/screens/welcome/welcome_viewmodel.dart';
import 'package:linkyou/views/screens/auth/auth_viewmodel.dart';
import 'package:linkyou/views/blocks/form_registration/form_registration_viewmodel.dart';
import 'package:linkyou/views/blocks/form_login/form_login_viewmodel.dart';
import 'package:linkyou/views/blocks/form_password_recovery/form_password_recovery_viewmodel.dart';
import 'package:linkyou/views/blocks/layout_menu/layout_menu_viewmodel.dart';
import 'package:linkyou/core/services/locator_service.dart';
import 'package:linkyou/views/blocks/users_new/users_new_viewmodel.dart';
import 'package:linkyou/views/blocks/users_daily/users_daily_viewmodel.dart';
import 'package:linkyou/views/blocks/users_daily_cities/users_daily_cities_viewmodel.dart';
import 'package:linkyou/views/screens/splash/splash_screen.dart';
import 'package:linkyou/views/screens/splash/splash_viewmodel.dart';
import 'package:linkyou/views/screens/user/user_viewmodel.dart';
import 'package:linkyou/views/widgets/controlls/circular_progress_blue.dart';
import 'package:linkyou/views/blocks/user_photos/user_photo_viewmodel.dart';
import 'package:linkyou/views/blocks/gifts_slider/gifts_slider_viewmodel.dart';
import 'package:intl/intl_standalone.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  setupTopUsersModule();
  WidgetsFlutterBinding.ensureInitialized();
  String? locale = await findSystemLocale();
  await initializeDateFormatting(locale, null);
  runApp(const LinkYouApp());
}

class LinkYouApp extends StatelessWidget {
  const LinkYouApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _buildProviders(),
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          final authProvider = serviceLocator<AuthProvider>();
          return authProvider.isLoading
              ? const Center(child: CircularProgressBlue())
              : MaterialApp(
                  title: 'LinkYou Mobile Application',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                    appBarTheme: const AppBarTheme(
                      iconTheme: IconThemeData(color: Colors.blue),
                    ),
                  ),
                  home: SplashScreen(authProvider: authProvider),
                  routes: RouteService.routes,
                );
        },
      ),
    );
  }

  List<ChangeNotifierProvider> _buildProviders() {
    return [
      ChangeNotifierProvider<AuthProvider>(
          create: (context) => serviceLocator<AuthProvider>()),
      ChangeNotifierProvider<UsersTopViewModel>(
          create: (context) => serviceLocator<UsersTopViewModel>()),
      ChangeNotifierProvider<WelcomeViewModel>(
          create: (context) => serviceLocator<WelcomeViewModel>()),
      ChangeNotifierProvider<AuthViewModel>(
          create: (context) => serviceLocator<AuthViewModel>()),
      ChangeNotifierProvider<FormRegistrationViewModel>(
          create: (context) => serviceLocator<FormRegistrationViewModel>()),
      ChangeNotifierProvider<FormPasswordRecoveryViewModel>(
          create: (context) => serviceLocator<FormPasswordRecoveryViewModel>()),
      ChangeNotifierProvider<LayoutMenuViewModel>(
          create: (context) => serviceLocator<LayoutMenuViewModel>()),
      ChangeNotifierProvider<UsersNewViewModel>(
          create: (context) => serviceLocator<UsersNewViewModel>()),
      ChangeNotifierProvider<UsersDailyViewModel>(
          create: (context) => serviceLocator<UsersDailyViewModel>()),
      ChangeNotifierProvider<UsersDailyCitiesViewModel>(
          create: (context) => serviceLocator<UsersDailyCitiesViewModel>()),
      ChangeNotifierProvider<FormLoginViewModel>(
          create: (context) => serviceLocator<FormLoginViewModel>()),
      ChangeNotifierProvider<SplashViewModel>(
          create: (context) => serviceLocator<SplashViewModel>()),
      ChangeNotifierProvider<UserViewModel>(
          create: (context) => serviceLocator<UserViewModel>()),
      ChangeNotifierProvider<UserPhotoViewModel>(
          create: (context) => serviceLocator<UserPhotoViewModel>()),
      ChangeNotifierProvider<GiftsSliderViewModel>(
          create: (context) => serviceLocator<GiftsSliderViewModel>()),
    ];
  }
}
