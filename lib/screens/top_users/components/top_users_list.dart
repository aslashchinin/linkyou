import 'package:flutter/material.dart';
import 'package:linkyou/common/widgets/UserCardShort.dart';

class TopUsersList extends StatelessWidget {
  final List<dynamic> users;

  const TopUsersList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
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
                '/user',
                arguments: user['id'],
              );
            },
          ),
        );
      },
    );
  }
}
