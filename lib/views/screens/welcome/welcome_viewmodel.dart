import 'package:flutter/material.dart';
import 'package:linkyou/core/services/route_service.dart';

class WelcomeViewModel extends ChangeNotifier {
  WelcomeViewModel();

  void register(BuildContext context) {
    Navigator.pushNamed(context, RouteService.registration);
    notifyListeners();
  }

  void login(BuildContext context) {
    Navigator.pushNamed(context, RouteService.login);
    notifyListeners();
  }

  void home(BuildContext context) {
    Navigator.pushNamed(context, RouteService.home);
    notifyListeners();
  }
}
