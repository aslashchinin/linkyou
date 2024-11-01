import 'package:flutter/material.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/core/models/photo.dart';

class UserPhotoViewModel extends ChangeNotifier {
  UserPhotoViewModel({required this.repository});

  final UserRepositoryInterface repository;

  List<Photo> photos = [];

  Future<void> loadUserPhotos(BigInt id) async {
    final response = await repository.getUserPhotos(id);
    photos = response.data;
    notifyListeners();
  }
}
