import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:linkyou/views/blocks/layout_appbar/layout_appbar_block.dart';

class UblogGalleryWindow extends StatelessWidget {
  final List<String> photoUrls;
  final int initialIndex;

  const UblogGalleryWindow(
      {required this.photoUrls, required this.initialIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LayoutAppBarBlock(showStarIcon: false),
      backgroundColor: Colors.white,
      body: PhotoViewGallery.builder(
        itemCount: photoUrls.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(photoUrls[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 5,
          );
        },
        scrollPhysics: const BouncingScrollPhysics(),
        pageController: PageController(initialPage: initialIndex),
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
  }
}
