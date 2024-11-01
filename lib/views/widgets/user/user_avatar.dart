import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:linkyou/core/models/user.dart';
import 'package:linkyou/views/blocks/layout_appbar/layout_appbar_block.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:linkyou/views/widgets/controlls/circular_progress_blue.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    String url = user.avatar.src.origin;

    return GestureDetector(
      onTap: () => showFullScreenImage(url, context),
      child: Stack(
        children: [
          CachedNetworkImage(
            cacheManager: CacheManager(
              Config(
                url,
                stalePeriod: const Duration(days: 7),
                maxNrOfCacheObjects: 100,
              ),
            ),
            placeholder: (context, url) => const Center(child: CircularProgressBlue()),
            fadeInDuration: Duration.zero,
            fadeOutDuration: Duration.zero,
            imageUrl: url,
            errorWidget: (context, url, error) =>
                const Icon(Icons.error), // Ошибка загрузки
            height: 450,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: List.generate(100, (index) {
                    return Colors.black.withOpacity(index * 0.01);
                  }),
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name}, ${user.birthday.age}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${user.job?.profession}, ${user.job?.occupation}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showFullScreenImage(String imageUrl, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
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
        ),
      ),
    );
  }
}
