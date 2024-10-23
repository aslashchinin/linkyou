import 'package:flutter/material.dart';

class AppBarBlockViewModel extends ChangeNotifier {
  AppBarBlockViewModel();

  void top(BuildContext context) {
    notifyListeners();
  }

  void search(BuildContext context) {
    notifyListeners();
  }
}
