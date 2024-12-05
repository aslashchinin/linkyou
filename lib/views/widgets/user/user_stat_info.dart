import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user.dart';
import 'package:linkyou/core/helpers/build_helper.dart';

class UserStatInfo extends StatelessWidget {
  const UserStatInfo({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 15,
          runSpacing: 10,
          children: [
            BuildHelper.buildIconInfo(
                user.likes.isLiked ? Icons.favorite : Icons.favorite_border,
                '${user.likes.count} лайков'),
            BuildHelper.buildIconInfo(
                Icons.camera_enhance, '${user.photosCount} фото'),
            BuildHelper.buildIconInfo(
                Icons.location_city_sharp, user.location.cityName),
          ],
        ),
      ),
    );
  }  
}
