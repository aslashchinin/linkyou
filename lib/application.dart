import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:linkyou/core/services/locator_service.dart';
import 'package:linkyou/core/services/route_service.dart';
import 'package:linkyou/pages/splash/splash_screen.dart';
import 'package:linkyou/ui/widgets/controlls/circular_progress_blue.dart';

class LinkYouApp extends StatelessWidget {
  const LinkYouApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ServiceLocator.getProviders(),
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
}
