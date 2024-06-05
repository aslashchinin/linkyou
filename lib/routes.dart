import 'package:flutter/material.dart';
import 'package:linkyou/screens/main/main.dart';
import 'package:linkyou/screens/user/user.dart';
import 'screens/welcome/welcome.dart';
import 'screens/authorize/authorize.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String registration = '/registration';
  static const String login = '/login';
  static const String main = '/welcome';
  static const String user = '/user';

  static Map<String, WidgetBuilder> get routes {
    return {
      main: (context) => MainScreen(),
      welcome: (context) => const WelcomeScreen(),
      registration: (context) => AuthScreen(initialTab: 1),
      login: (context) => AuthScreen(initialTab: 0),
      user: (context) =>
          UserScreen(userId: ModalRoute.of(context)!.settings.arguments as int),
    };
  }
}
