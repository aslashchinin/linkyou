import 'package:flutter/material.dart';
import 'package:linkyou/core/models/city_highlighted.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';


class UsersDailyCitiesViewModel extends ChangeNotifier {
  UsersDailyCitiesViewModel({required this.repository});

  final UserRepositoryInterface repository;

  List<CityHighlighted> cities = [];

  Future<void> loadDailyUsersCities() async {
    final response = await repository.getDailyUsersCities();
    cities = response.data;
    notifyListeners();
  }
}
