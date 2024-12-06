import 'package:flutter/material.dart';
import 'package:linkyou/core/services/route_service.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:linkyou/core/services/locator_service.dart';

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

  void userProfile(BuildContext context, BigInt userId) {
    Navigator.pushNamed(context, RouteService.user, arguments: userId);
    notifyListeners();
  }

  void logout(BuildContext context) {
    final authProvider = serviceLocator<AuthProvider>();
    authProvider.logout();
    Navigator.pushNamed(context, RouteService.home);
    notifyListeners();
  }

  void likeYou(BuildContext context) {
    Navigator.pushNamed(context, RouteService.likeYou);
    notifyListeners();
  }
}
