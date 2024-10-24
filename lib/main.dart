import 'package:flutter/material.dart';
import 'package:linkyou/views/blocks/top_users/top_users_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:linkyou/core/services/route_service.dart';
import 'package:linkyou/views/screens/welcome/welcome_screen.dart';
import 'package:linkyou/views/screens/welcome/welcome_viewmodel.dart';
import 'package:linkyou/views/screens/auth/auth_viewmodel.dart';
import 'package:linkyou/views/blocks/registration/registration_viewmodel.dart';
import 'package:linkyou/views/blocks/login/login_viewmodel.dart';
import 'package:linkyou/views/blocks/password_recovery/password_recovery_viewmodel.dart';
import 'package:linkyou/views/blocks/app_bar/app_bar_viewmodel.dart';
import 'package:linkyou/views/blocks/drawer_menu/drawer_menu_viewmodel.dart';
import 'package:linkyou/core/services/locator_service.dart';

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
        ChangeNotifierProvider<WelcomeViewModel>(
          create: (_) => WelcomeViewModel(),
        ),
        ChangeNotifierProvider<AuthViewModel>(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider<RegistrationViewModel>(
          create: (_) => RegistrationViewModel(),
        ),
        ChangeNotifierProvider<LoginViewModel>(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider<PasswordRecoveryViewModel>(
          create: (_) => PasswordRecoveryViewModel(),
        ),
        ChangeNotifierProvider<AppBarBlockViewModel>(
          create: (_) => AppBarBlockViewModel(),
        ),
        ChangeNotifierProvider<DrawerMenuViewModel>(
          create: (_) => DrawerMenuViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => serviceLocator<TopUsersViewModel>(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return MaterialApp(
            title: 'LinkYou Mobile',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.blue,
                ),
              ),
            ),
            home: const WelcomeScreen(),
            routes: RouteService.routes,
          );
        },
      ),
    );
  }
}
