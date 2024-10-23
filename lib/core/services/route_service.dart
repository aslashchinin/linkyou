import 'package:flutter/material.dart';
import 'package:linkyou/views/screens/welcome/welcome_screen.dart';
import 'package:linkyou/views/screens/home/home_screen.dart';
import 'package:linkyou/views/screens/auth/auth_screen.dart';
import 'package:linkyou/views/screens/top/top_screen.dart';
import 'package:linkyou/views/screens/search/search_screen.dart';

class RouteService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String welcome = '/welcome';
  static const String registration = '/registration';
  static const String login = '/login';
  static const String home = '/home';
  static const String top = '/top';
  static const String search = '/search';

  static Map<String, WidgetBuilder> get routes {
    return {
      welcome: (context) => const WelcomeScreen(),
      registration: (context) => const AuthScreen(initialTab: 1),
      login: (context) => const AuthScreen(initialTab: 0),
      home: (context) => const HomeScreen(),
      top: (context) => const TopScreen(),
      search: (context) => const SearchScreen(),
    };
  }
}
