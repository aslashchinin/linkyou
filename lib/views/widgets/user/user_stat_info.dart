import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user.dart';

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
            _buildIconInfo(Icons.favorite_border,
                '${user.likes.count} лайков'),
            _buildIconInfo(
                Icons.camera_enhance, '${user.photosCount} фото'),
            _buildIconInfo(Icons.location_city_sharp,
                '${user.location.cityName}'),
          ],
        ),
      ),
    );
  }

  Widget _buildIconInfo(IconData icon, String info) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 18,
        ),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            info,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
