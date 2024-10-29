import 'package:flutter/material.dart';

class FormRegistrationViewModel extends ChangeNotifier {
  FormRegistrationViewModel();

  void register(BuildContext context) {
    notifyListeners();
  }
}
