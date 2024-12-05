import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:linkyou/core/models/user.dart';
import 'package:linkyou/views/widgets/controlls/circular_progress_blue.dart';
import 'package:linkyou/views/widgets/windows/user_avatar_window.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    String url = user.avatar.src.origin;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserAvatarWindow(imageUrl: url)),
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            placeholder: (context, url) =>
                const Center(child: CircularProgressBlue()),
            fadeInDuration: Duration.zero,
            fadeOutDuration: Duration.zero,
            imageUrl: url,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: height * 0.7,
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
}
