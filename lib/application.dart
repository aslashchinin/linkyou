import 'package:flutter/material.dart';
import 'package:linkyou/screens/about/about.dart';
import 'package:linkyou/screens/main/main.dart';
import 'package:linkyou/screens/welcome/welcome.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'common/providers/auth_provider.dart';

class LinkYouApp extends StatelessWidget {
  const LinkYouApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          // Дожидаемся окончания загрузки токена
          if (authProvider.isLoading) {
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
              home: const Scaffold(
                body: Center(
                  child:
                      CircularProgressIndicator(), // Показать индикатор загрузки
                ),
              ),
            );
          } else {
            // В зависимости от наличия токена выбираем маршрут
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
              home: authProvider.token == null
                  ? WelcomeScreen() // Если токена нет, показываем экран логина
                  : MainScreen(), // Если токен есть, показываем основной экран
              routes: AppRoutes.routes,
            );
          }
        },
      ),
    );
  }
}
