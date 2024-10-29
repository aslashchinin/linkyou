import 'package:flutter/material.dart';
import 'package:linkyou/views/blocks/form_password_recovery/form_password_recovery_block.dart';

class FormLoginViewModel extends ChangeNotifier {
  FormLoginViewModel();

  void login(BuildContext context) {
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
