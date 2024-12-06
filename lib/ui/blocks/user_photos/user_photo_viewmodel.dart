import 'package:flutter/material.dart';
import 'package:linkyou/models/photo.dart';
import 'package:linkyou/data/photo/photo_repository_interface.dart';
import 'package:linkyou/core/base/block_viewmodel_base.dart';
import 'package:linkyou/pages/photo/photo_screen.dart';

class UserPhotoViewModel
    extends BlockViewModelBase<Photo, PhotoRepositoryInterface> {
  UserPhotoViewModel({required super.repository});

  Future<void> loadUserPhotos(BigInt id) async {
    print('loadUserPhotos $id');

    await handleItemsLoading(
      loadFunction: () => repository.getPhotosList(id),
    );
  }

  void navigateToPhoto(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PhotoScreen(
                photos: state.items as List<Photo>, initialIndex: index)));
  }
}
