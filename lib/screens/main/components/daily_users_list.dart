import 'package:flutter/material.dart';
import 'package:linkyou/routes.dart';
import '../../../common/widgets/UserCardShort.dart';

class DailyUsersList extends StatelessWidget {
  final List<dynamic> users;
  final bool isLoading;
  final VoidCallback onLoadMore;

  DailyUsersList({
    required this.users,
    required this.isLoading,
    required this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: users.length + 1,
      itemBuilder: (context, index) {
        if (index == users.length) {
          return Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: onLoadMore,
                    child: const Text('Показать еще'),
                  ),
          );
        }
        final user = users[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: UserCardShort(
            avatarUrl: 'https:${user['avatar']['src']['square']}',
            name: user['name'],
            age: user['birthday']['age'],
            profession: user['job']['profession'],
            occupation: user['job']['occupation'],
            photosCount: user['photos_count'],
            city: user['location']['city_name'],
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.user,
                arguments: user['id'],
              );
            },
          ),
        );
      },
    );
  }
}
