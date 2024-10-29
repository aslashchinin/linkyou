import 'package:flutter/material.dart';
import 'package:linkyou/views/blocks/form_password_recovery/form_password_recovery_block.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString('token', response.data.token);
        prefs.setString('user', jsonEncode(response.data.user));
      });
      
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
