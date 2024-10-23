import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:linkyou/core/services/route_service.dart';
import 'package:linkyou/views/screens/welcome/welcome_screen.dart';
import 'package:linkyou/views/screens/welcome/welcome_viewmodel.dart';
import 'package:linkyou/views/screens/auth/auth_viewmodel.dart';
import 'package:linkyou/views/blocks/registration/registration_viewmodel.dart';
import 'package:linkyou/views/blocks/login/login_viewmodel.dart';

void main() {
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
