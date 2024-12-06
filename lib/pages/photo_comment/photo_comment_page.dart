import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/models/photo.dart';
import 'package:linkyou/ui/blocks/layout_appbar/layout_appbar_block.dart';
import 'package:linkyou/ui/containers/photo_comments/photo_comments_container.dart';

class PhotoCommentScreen extends ScreenBase {
  const PhotoCommentScreen({super.key, required this.photo});

  final Photo photo;

  @override
  PhotoCommentScreenState createState() => PhotoCommentScreenState();
}

class PhotoCommentScreenState extends ScreenBaseState<PhotoCommentScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildContent(BuildContext context) {
    return PhotoCommentsContainer(photo: widget.photo);
  }

  @override
  bool get showDrawer => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const LayoutAppBarBlock(
      showStarIcon: false,
    );
  }
}
