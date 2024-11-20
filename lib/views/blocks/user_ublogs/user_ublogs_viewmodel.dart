import 'package:flutter/material.dart';
import 'package:linkyou/data/ublog/ublog_repository_interface.dart';
import 'package:linkyou/core/models/ublog_post.dart';
import 'package:linkyou/core/services/route_service.dart';

class UserUblogsViewModel extends ChangeNotifier {
  UserUblogsViewModel({required this.repository});

  final UblogRepositoryInterface repository;

  List<UblogPost> ublogs = [];

  Future<void> loadUserUblogs(BigInt id, int? limit) async {
    final response = await repository.getUblogsList(id, limit);
    ublogs = response.data;
    notifyListeners();
  }

  void navigateToUblogs(BuildContext context, BigInt id) {
    Navigator.pushNamed(context, RouteService.userUblogs, arguments: id);
  }
}
