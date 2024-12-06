import 'package:flutter/material.dart';
import 'package:linkyou/views/blocks/form_password_recovery/form_password_recovery_block.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:linkyou/screens/home/home_screen.dart';
import 'package:linkyou/core/services/locator_service.dart';
import 'package:linkyou/data/auth/auth_repository_interface.dart';
import 'package:linkyou/core/models/auth_signin_input.dart';

class FormLoginViewModel extends ChangeNotifier {
  FormLoginViewModel({required AuthRepositoryInterface repository}) : _repository = repository;

  final AuthRepositoryInterface _repository;
  AuthRepositoryInterface get repository => _repository;

  Future<void> login(BuildContext context, String email, String password) async {
    try {
      final response = await repository.signIn(AuthSigninInput(
        login: email,
        password: password,
      ));

      final authProvider = serviceLocator<AuthProvider>();
      authProvider.login(response.data);

      if (authProvider.token != null) {
        if (context.mounted) {
          notifyListeners();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }
      } else {
        throw Exception('Токен отсутствует');
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Авторизация не удалась')),
        );
      }
    }
  }

  void showPasswordRecoveryDialog(BuildContext context) {
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (context) {
          return const FormPasswordRecoveryBlock();
        },
      );
      notifyListeners();
    }
  }
}