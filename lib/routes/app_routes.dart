import 'package:flutter/material.dart';
import '../screens/welcome_screen.dart';
import '../screens/auth/auth_screen.dart';
import '../screens/main_screen.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String registration = '/registration';
  static const String login = '/login';
  static const String recentUsers = '/recent_users';
  static const String main = '/main';

  static Map<String, WidgetBuilder> get routes {
    return {
      welcome: (context) => WelcomeScreen(),
      registration: (context) => AuthScreen(initialTab: 1),
      login: (context) => AuthScreen(initialTab: 0),      
      main: (context) => MainScreen(),
    };
  }
}