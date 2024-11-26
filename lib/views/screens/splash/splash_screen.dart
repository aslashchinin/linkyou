import 'package:flutter/material.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'splash_viewmodel.dart';
import 'package:linkyou/core/enums/common_loading_enum.dart';

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
    super.initState();
    authProvider = widget.authProvider;
    viewModel = Provider.of<SplashViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeData();
    });
  }

  void initializeData() {
    viewModel.fetchCurrentUser();

    viewModel.addListener(() {
      if (viewModel.currentUserStatus == CommonLoadingStatus.loaded) {
        authProvider.user = viewModel.currentUser;
        authProvider.isAuthenticated = true;
        
        viewModel.navigateToHome(context);
      } else if (viewModel.currentUserStatus == CommonLoadingStatus.error) {
        authProvider.isAuthenticated = false;
        authProvider.user = null;
        authProvider.token = null;
        viewModel.navigateToWelcome(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SplashViewModel>(context);

    if (viewModel.currentUserStatus == CommonLoadingStatus.loading ||
        viewModel.currentUserStatus == CommonLoadingStatus.initial) {
      return Scaffold(
        body: Center(
          child: Image.asset('assets/logo-blue/logo.png'),
        ),
      );
    }

    return const SizedBox();
  }
}
