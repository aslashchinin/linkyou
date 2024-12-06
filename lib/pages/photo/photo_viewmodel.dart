import 'package:linkyou/models/photo.dart';
import 'package:linkyou/data/photo/photo_repository_interface.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:linkyou/core/services/route_service.dart';

class PhotoViewModel extends ChangeNotifier {
  PhotoViewModel({required this.repository});

  final PhotoRepositoryInterface repository;

  sharePhoto(Photo photo) {
    Share.share(photo.src.origin, subject: 'Поделиться фотографией!');
  }

  likePhoto(Photo photo) {
    // Like photo
  }

  commentPhoto(Photo photo, BuildContext context) {
    Navigator.pushNamed(context, RouteService.photoComment, arguments: photo);
  }

  deletePhoto(Photo photo) {
    // Delete photo
  }
}
