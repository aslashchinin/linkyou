import 'package:flutter/material.dart';
import 'package:linkyou/core/services/route_service.dart';

class DrawerMenuViewModel extends ChangeNotifier {
  DrawerMenuViewModel();

  void home(BuildContext context) {
    Navigator.pushNamed(context, RouteService.home);
    notifyListeners();
  }

  void search(BuildContext context) {
    notifyListeners();
  }

  void blogs(BuildContext context) {
    notifyListeners();
  }

  void top(BuildContext context) {
    notifyListeners();
  }

  void about(BuildContext context) {
    notifyListeners();
  }

  void blog(BuildContext context) {
    notifyListeners();
  }
}
