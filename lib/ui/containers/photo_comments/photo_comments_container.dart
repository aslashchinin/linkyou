import 'package:flutter/material.dart';
import 'package:linkyou/models/photo.dart';
import 'package:linkyou/ui/blocks/photo_comments/photo_comments_block.dart';

class PhotoCommentsContainer extends StatelessWidget {
  const PhotoCommentsContainer({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: PhotoCommentsBlock(photo: photo),
      ),
    ]);
  }
}
