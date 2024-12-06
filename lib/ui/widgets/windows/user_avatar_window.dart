import 'package:flutter/material.dart';
import 'package:linkyou/ui/blocks/layout_appbar/layout_appbar_block.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
class UserAvatarWindow extends StatelessWidget {
  final String imageUrl;
  const UserAvatarWindow({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LayoutAppBarBlock(showStarIcon: false),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(0),
          child: PhotoView(
            imageProvider: CachedNetworkImageProvider(imageUrl),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 8,
          ),
        ),
      ),
    );
  }
}
