import 'package:flutter/material.dart';
import 'package:linkyou/views/screens/welcome/welcome_screen.dart';
import 'package:linkyou/views/screens/home/home_screen.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/core/models/user.dart';
import 'package:linkyou/core/enums/common_loading_enum.dart';

class SplashViewModel extends ChangeNotifier {  
  SplashViewModel({required UserRepositoryInterface repository})
      : _repository = repository;

  final UserRepositoryInterface _repository;
  UserRepositoryInterface get repository => _repository;

  User? _currentUser;
  User? get currentUser => _currentUser;

  CommonLoadingStatus _currentUserStatus = CommonLoadingStatus.initial;
  CommonLoadingStatus get currentUserStatus => _currentUserStatus;

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

  Future<void> fetchCurrentUser() async {
    try {
      _currentUserStatus = CommonLoadingStatus.loading;
      notifyListeners();
    
      await Future.delayed(const Duration(seconds: 3)); 

      final response = await _repository.getCurrentUser();
      _currentUser = response.data;
      _currentUserStatus = CommonLoadingStatus.loaded;
    } catch (e) {
      _currentUserStatus = CommonLoadingStatus.error;
    } finally {
      notifyListeners();
    }
  }
}
