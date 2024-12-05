import 'package:flutter/material.dart';
import 'package:linkyou/core/services/route_service.dart';

class LayoutAppBarViewModel {
  LayoutAppBarViewModel();

  void top(BuildContext context) {
    Navigator.pushNamed(context, RouteService.top);
  }

  void search(BuildContext context) {
    Navigator.pushNamed(context, RouteService.search);
  }

  void home(BuildContext context) {
    Navigator.pushNamed(context, RouteService.home);
  }
}
