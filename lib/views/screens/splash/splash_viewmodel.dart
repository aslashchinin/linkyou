import 'package:flutter/material.dart';
import 'package:linkyou/views/screens/welcome/welcome_screen.dart';
import 'package:linkyou/views/screens/home/home_screen.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> navigateToWelcome(BuildContext context) async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
    );
  }

  Future<void> navigateToHome(BuildContext context) async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }
}
