import 'package:flutter/material.dart';
import 'package:linkyou/views/blocks/password_recovery/password_recovery_block.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel();

  void login(BuildContext context) {
    notifyListeners();
  }

  void showPasswordRecoveryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const PasswordRecoveryBlock();
      },
    );
    notifyListeners();
  }
}
