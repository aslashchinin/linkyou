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
import 'package:linkyou/views/blocks/layout_appbar/layout_appbar_viewmodel.dart';
import 'package:linkyou/views/blocks/layout_menu/layout_menu_viewmodel.dart';
import 'package:linkyou/core/services/locator_service.dart';
import 'package:linkyou/views/blocks/users_new/users_new_viewmodel.dart';
import 'package:linkyou/views/blocks/users_daily/users_daily_viewmodel.dart';
import 'package:linkyou/views/blocks/users_daily_cities/users_daily_cities_viewmodel.dart';
import 'package:linkyou/views/screens/splash/splash_screen.dart';
import 'package:linkyou/views/screens/splash/splash_viewmodel.dart';
import 'package:linkyou/views/screens/user/user_viewmodel.dart';

void main() {
  setupTopUsersModule();
  runApp(const LinkYouApp());
}

class LinkYouApp extends StatelessWidget {
  const LinkYouApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [        
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => serviceLocator<UsersTopViewModel>(),
        ),
        
        ChangeNotifierProvider<WelcomeViewModel>(
          create: (_) => WelcomeViewModel(),
        ),
        ChangeNotifierProvider<AuthViewModel>(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider<FormRegistrationViewModel>(
          create: (_) => FormRegistrationViewModel(),
        ),        
        ChangeNotifierProvider<FormPasswordRecoveryViewModel>(
          create: (_) => FormPasswordRecoveryViewModel(),
        ),
        ChangeNotifierProvider<LayoutAppBarViewModel>(
          create: (_) => LayoutAppBarViewModel(),
        ),
        ChangeNotifierProvider<LayoutMenuViewModel>(
          create: (_) => LayoutMenuViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => serviceLocator<UsersNewViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => serviceLocator<UsersDailyViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => serviceLocator<UsersDailyCitiesViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => serviceLocator<FormLoginViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => SplashViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => serviceLocator<UserViewModel>(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return authProvider.isLoading ? const Center(child: CircularProgressIndicator()) : MaterialApp(
            title: 'LinkYou Mobile Application',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.blue,
                ),
              ),
            ),
            home: SplashScreen(authProvider: authProvider),
            routes: RouteService.routes,
          );
        },
      ),
    );
  }
}
