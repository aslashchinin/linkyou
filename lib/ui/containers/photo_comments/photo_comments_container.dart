import 'package:flutter/material.dart';
import 'package:linkyou/models/photo.dart';
import 'package:linkyou/ui/blocks/photo_comments/photo_comments_block.dart';
import 'package:linkyou/ui/blocks/photo_comments_form/photo_comments_form_block.dart';
import 'package:linkyou/ui/blocks/photo_comments/photo_comments_viewmodel.dart';
import 'package:provider/provider.dart';

class PhotoCommentsContainer extends StatelessWidget {
  const PhotoCommentsContainer({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PhotoCommentsViewModel>(context);
    return Column(children: [
      Expanded(
        child: PhotoCommentsBlock(photo: photo),
      ),
      const Divider(
        height: 1,
        color: Color(0xFFE0E0E0),
      ),
      PhotoCommentsFormBlock(onSendPressed: (comment) {
        viewModel.sendComment(photo.id, comment);
      }),
      const SizedBox(height: 20),
    ]);
  }
}
