import 'package:flutter/material.dart';

class FormPasswordRecoveryViewModel extends ChangeNotifier {
  FormPasswordRecoveryViewModel();

  void recover(BuildContext context) {
    notifyListeners();
  }
}
