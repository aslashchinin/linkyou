import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:linkyou/views/blocks/layout_appbar/layout_appbar_block.dart';
import 'package:linkyou/core/models/photo.dart';

class PhotoGalleryWindow extends StatelessWidget {
  final List<Photo> photos;
  final int initialIndex;

  const PhotoGalleryWindow({
    required this.photos,
    required this.initialIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBarBlock(
        showStarIcon: false,
        showSearchIcon: false,
        customActions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.fullscreen),
                      title: const Text('Открыть в полном размере'),
                      onTap: () {
                        // Add to favorites action
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.delete, color: Colors.red),
                      title: const Text('Удалить фотографию',
                          style: TextStyle(color: Colors.red)),
                      onTap: () {
                        // Report action
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: photos.length,
            controller: PageController(initialPage: initialIndex),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  PhotoView(
                    imageProvider: NetworkImage(photos[index].src.origin),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 5,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      child: Text(
                        'Ваши фотографии ${index + 1} из ${photos.length}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.favorite, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                photos[index].likesCount.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.comment, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                photos[index].commentsCount.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
