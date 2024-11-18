import 'package:flutter/material.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  final AuthProvider authProvider;

  const SplashScreen({super.key, required this.authProvider});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashViewModel viewModel;
  late final AuthProvider authProvider;

  @override
  void initState() {
    super.initState(); // Вызовите суперкласс

    authProvider = widget.authProvider;
    viewModel = SplashViewModel();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return; // Проверка, смонтирован ли виджет
      if (authProvider.isAuthenticated) {
        viewModel.navigateToHome(context);
      } else {
        viewModel.navigateToWelcome(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo-blue/logo.png'),
      ),
    );
  }
}
