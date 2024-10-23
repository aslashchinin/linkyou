import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel();

  void login(BuildContext context) {
    notifyListeners();
  }

  void showPasswordRecoveryDialog(BuildContext context) {
    notifyListeners();
  }
}
