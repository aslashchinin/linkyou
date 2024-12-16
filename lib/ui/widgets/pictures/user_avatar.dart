import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/core/providers/user_status_provider.dart';

class UserAvatarWithStatus extends StatelessWidget {
  final BigInt userId;
  final String avatarUrl;
  final bool isOnline;

  const UserAvatarWithStatus({
    required this.userId,
    required this.avatarUrl,
    required this.isOnline,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserStatusProvider>(
      builder: (context, provider, _) {
        return StreamBuilder<Map<BigInt, bool>>(
          stream: provider.statusStream,
          builder: (context, snapshot) {
            final currentIsOnline =
                snapshot.data?[userId] ?? isOnline;
            return Stack(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIsOnline ? Colors.green : Colors.grey,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
