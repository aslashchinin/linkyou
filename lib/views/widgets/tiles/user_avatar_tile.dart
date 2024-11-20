import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user_short.dart';
import 'package:linkyou/core/services/route_service.dart';

class UserAvatarTile extends StatelessWidget {
  const UserAvatarTile({required this.user, this.additionalText, super.key});

  final UserShort user;
  final String? additionalText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, RouteService.user, arguments: user.id),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(user.avatar.src.small),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                additionalText ?? '',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
