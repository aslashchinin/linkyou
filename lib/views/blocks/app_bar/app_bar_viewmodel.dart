import 'package:flutter/material.dart';
import 'package:linkyou/core/services/route_service.dart';

class AppBarBlockViewModel extends ChangeNotifier {
  AppBarBlockViewModel();

  void top(BuildContext context) {
    Navigator.pushNamed(context, RouteService.top);
    notifyListeners();
  }

  void search(BuildContext context) {
    Navigator.pushNamed(context, RouteService.search);
    notifyListeners();
  }
}
