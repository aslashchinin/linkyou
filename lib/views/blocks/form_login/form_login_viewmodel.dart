import 'package:flutter/material.dart';
import 'package:linkyou/views/blocks/form_password_recovery/form_password_recovery_block.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:linkyou/views/screens/home/home_screen.dart';

class FormLoginViewModel extends ChangeNotifier {
  FormLoginViewModel({required UserRepositoryInterface repository})
      : _repository = repository;

  final UserRepositoryInterface _repository;
  UserRepositoryInterface get repository => _repository;

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      final response = await repository.login(email, password);
      // Save token and user to shared preferences
      AuthProvider().login(response.data);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Авторизация не удалась')),
      );
    }

    notifyListeners();
  }

  void showPasswordRecoveryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const FormPasswordRecoveryBlock();
      },
    );
    notifyListeners();
  }
}
