import 'package:flutter/material.dart';
import 'package:linkyou/core/models/photo.dart';
import 'package:linkyou/data/photo/photo_repository_interface.dart';

class UserPhotoViewModel extends ChangeNotifier {
  UserPhotoViewModel({required this.repository});

  final PhotoRepositoryInterface repository;

  List<Photo> photos = [];

  Future<void> loadUserPhotos(BigInt id) async {
    final response = await repository.getPhotosList(id);
    photos = response.data;
    notifyListeners();
  }
}
