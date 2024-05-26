import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String age;
  final String profession;
  final String occupation;
  final int photosCount;
  final String city;
  final VoidCallback onTap;

  UserCard({
    required this.avatarUrl,
    required this.name,
    required this.age,
    required this.profession,
    required this.occupation,
    required this.photosCount,
    required this.city,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
              radius: 40,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$name, $age', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('$profession, $occupation'),
                  Text('$photosCount фото · $city'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}