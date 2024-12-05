import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user.dart';
import 'package:linkyou/views/widgets/controlls/circular_progress_blue.dart';
import 'package:provider/provider.dart';
import 'user_photo_viewmodel.dart';
import 'package:linkyou/core/helpers/build_helper.dart';
import 'package:linkyou/core/helpers/pluralizer_helper.dart';
import 'package:linkyou/views/widgets/windows/photo_gallery_window.dart';

class UserPhotoBlock extends StatefulWidget {
  const UserPhotoBlock({super.key, required this.user});

  final User user;

  @override
  State<UserPhotoBlock> createState() => _UserPhotoBlockState();
}

class _UserPhotoBlockState extends State<UserPhotoBlock> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserPhotoViewModel>(context, listen: false)
        .loadUserPhotos(widget.user.id);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserPhotoViewModel>(context);
    final double width = (MediaQuery.of(context).size.width / 3) - 11;

    return viewModel.photos.isEmpty
        ? const Center(child: CircularProgressBlue())
        : Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.photo_camera, color: Colors.grey[700]),
                    const SizedBox(width: 8),
                    Text(
                      PluralizerHelper.getCount(
                          widget.user.photosCount, 'фото', 'фото', 'фото'),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: viewModel.photos
                      .asMap()
                      .entries
                      .take(3)
                      .map((entry) => GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhotoGalleryWindow(
                                      photos: viewModel.photos,
                                      initialIndex: entry.key))),
                          child: entry.key > 1
                              ? BuildHelper.buildLastImageWithOverlay(
                                  entry.value.src.small, width,
                                  remaining: viewModel.photos.length - 3)
                              : BuildHelper.buildImage(
                                  entry.value.src.small, width)))
                      .toList(),
                ),
              ],
            ),
          );
  }
}
