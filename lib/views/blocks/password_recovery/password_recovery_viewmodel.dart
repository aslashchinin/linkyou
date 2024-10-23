import 'package:flutter/material.dart';

class PasswordRecoveryViewModel extends ChangeNotifier {
  PasswordRecoveryViewModel();

  void recover(BuildContext context) {
    notifyListeners();
  }
}
