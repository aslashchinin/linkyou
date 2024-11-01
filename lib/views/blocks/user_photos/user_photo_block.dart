import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user.dart';
import 'package:linkyou/views/widgets/controlls/circular_progress_blue.dart';
import 'package:provider/provider.dart';
import 'user_photo_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

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
        .loadUserPhotos(BigInt.from(widget.user.id));
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
                      '${widget.user.photosCount} фото',
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
                      .map((entry) => entry.key > 1
                          ? _buildLastImageWithOverlay(
                              entry.value.src.small, width,
                              remaining: viewModel.photos.length - 3)
                          : _buildImage(entry.value.src.small, width))
                      .toList(),
                ),
              ],
            ),
          );
  }

  // Виджет для обычного изображения
  Widget _buildImage(String url, double width) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: width,
      height: 100,
      child: CachedNetworkImage(
        cacheManager: CacheManager(
          Config(
            url,
            stalePeriod: const Duration(days: 7),
            maxNrOfCacheObjects: 100,
          ),
        ),
        placeholder: (context, url) =>
            const Center(child: CircularProgressBlue()),
        fadeInDuration: Duration.zero,
        fadeOutDuration: Duration.zero,
        imageUrl: url,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        height: 100,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  // Виджет для последнего изображения с наложением текста
  Widget _buildLastImageWithOverlay(String url, double width,
      {int remaining = 0}) {
    return Stack(
      children: [
        _buildImage(url, width),
        Positioned.fill(
          left: 5,
          right: 5,
          child: Container(
            width: width,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),

        // Текст с количеством оставшихся фотографий
        remaining > 0
            ? Positioned.fill(
                child: Center(
                  child: Text(
                    '+$remaining',
                    style: const TextStyle(
                      color: Colors.white, // Белый текст
                      fontSize: 24, // Размер шрифта
                      fontWeight: FontWeight.bold, // Жирный шрифт
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
