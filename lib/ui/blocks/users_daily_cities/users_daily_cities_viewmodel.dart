import 'package:flutter/material.dart';
import 'package:linkyou/models/city_highlighted.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';


class UsersDailyCitiesViewModel extends ChangeNotifier {
  UsersDailyCitiesViewModel({required this.repository});

  final UserRepositoryInterface repository;

  List<CityHighlighted> cities = [];

  int? _cityId;
  int get cityId => _cityId ?? 0;

  setCity(int? cityId) {
    _cityId = cityId;
    notifyListeners();
  }

  Future<void> loadDailyUsersCities() async {
    final response = await repository.getDailyUsersCities();
    cities = response.data;
    notifyListeners();
  }
}
