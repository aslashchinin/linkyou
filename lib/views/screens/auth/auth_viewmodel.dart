import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel();

  void close(BuildContext context) {
    Navigator.of(context).pop();
    notifyListeners();
  }
}
