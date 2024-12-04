import 'package:flutter/material.dart';
import 'package:linkyou/views/blocks/layout_appbar/layout_appbar_block.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserAvatarWindow extends StatelessWidget {
  final String imageUrl;
  const UserAvatarWindow({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LayoutAppBarBlock(showStarIcon: false),
      body: Center(
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(0),
          minScale: 0.1,
          maxScale: 8.0,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
