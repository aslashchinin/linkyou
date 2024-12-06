import 'package:flutter/material.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/models/gifts.dart';

class GiftsSliderViewModel extends ChangeNotifier {
  GiftsSliderViewModel({required this.repository});

  final UserRepositoryInterface repository;

  List<Gifts> gifts = [];

  Future<void> loadGiftsList() async {
    final response = await repository.getGiftsList();
    gifts = response.data;
    notifyListeners();
  }
}
