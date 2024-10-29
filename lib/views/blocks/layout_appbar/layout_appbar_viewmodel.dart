import 'package:flutter/material.dart';
import 'package:linkyou/core/services/route_service.dart';

class LayoutAppBarViewModel extends ChangeNotifier {
  LayoutAppBarViewModel();

  void top(BuildContext context) {
    Navigator.pushNamed(context, RouteService.top);
    notifyListeners();
  }

  void search(BuildContext context) {
    Navigator.pushNamed(context, RouteService.search);
    notifyListeners();
  }

  void home(BuildContext context) {
    Navigator.pushNamed(context, RouteService.home);
    notifyListeners();
  }
}
