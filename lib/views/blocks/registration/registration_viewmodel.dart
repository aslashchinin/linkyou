import 'package:flutter/material.dart';

class RegistrationViewModel extends ChangeNotifier {
  RegistrationViewModel();

  void register(BuildContext context) {
    notifyListeners();
  }
}
