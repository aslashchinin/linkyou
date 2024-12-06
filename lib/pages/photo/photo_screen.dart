import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/models/photo.dart';
import 'package:photo_view/photo_view.dart';
import 'package:linkyou/ui/blocks/layout_appbar/layout_appbar_block.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:linkyou/pages/photo/photo_viewmodel.dart';
import 'package:linkyou/core/services/locator_service.dart';

class PhotoScreen extends ScreenBase {
  const PhotoScreen(
      {super.key, required this.photos, required this.initialIndex});

  final List<Photo> photos;
  final int initialIndex;

  @override
  PhotoScreenState createState() => PhotoScreenState();
}

class PhotoScreenState extends ScreenBaseState<PhotoScreen> {
  late PageController controller;
  late PhotoViewModel viewModel;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.initialIndex);
    viewModel = serviceLocator<PhotoViewModel>();
  }

  @override
  Widget buildContent(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          itemCount: widget.photos.length,
          controller: controller,
          itemBuilder: (context, index) {
            Photo photo = widget.photos[index];

            return Stack(
              children: [
                PhotoView(
                  imageProvider: CachedNetworkImageProvider(photo.src.origin),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 8,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Text(
                      'Ваши фотографии ${index + 1} из ${widget.photos.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 35,
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
                            Icon(Icons.favorite,
                                color:
                                    photo.isLiked ? Colors.red : Colors.white),
                            const SizedBox(width: 8),
                            Text(
                              photo.likesCount.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => viewModel.commentPhoto(
                              widget.photos[controller.page?.toInt() ?? 0],
                              context),
                          child: Row(
                            children: [
                              const Icon(Icons.comment, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                photo.commentsCount.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
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
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return LayoutAppBarBlock(
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
                    leading: const Icon(Icons.share),
                    title: const Text('Поделиться фотографией'),
                    onTap: () {
                      viewModel.sharePhoto(
                          widget.photos[controller.page?.toInt() ?? 0]);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete, color: Colors.red),
                    title: const Text('Удалить фотографию',
                        style: TextStyle(color: Colors.red)),
                    onTap: () {
                      viewModel.deletePhoto(
                          widget.photos[controller.page?.toInt() ?? 0]);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get showDrawer => false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
