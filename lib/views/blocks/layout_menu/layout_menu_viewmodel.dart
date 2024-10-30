import 'package:flutter/material.dart';
import 'package:linkyou/core/services/route_service.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LayoutMenuViewModel extends ChangeNotifier {
  LayoutMenuViewModel();

  void home(BuildContext context) {
    Navigator.pushNamed(context, RouteService.home);
    notifyListeners();
  }

  void search(BuildContext context) {
    Navigator.pushNamed(context, RouteService.search);
    notifyListeners();
  }

  void blogs(BuildContext context) {
    notifyListeners();
  }

  void top(BuildContext context) {
    Navigator.pushNamed(context, RouteService.top);
    notifyListeners();
  }

  void about(BuildContext context) {
    Navigator.pushNamed(context, RouteService.about);
    notifyListeners();
  }

  void blog(BuildContext context) {
    notifyListeners();
  }

  void logout(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false).logout();
    Navigator.pushNamed(context, RouteService.home);
    notifyListeners();
  }
}
