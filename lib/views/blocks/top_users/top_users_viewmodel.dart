import 'package:flutter/material.dart';

class TopUsersViewModel extends ChangeNotifier {
  TopUsersViewModel();

  void login(BuildContext context) {
    notifyListeners();
  }
}
