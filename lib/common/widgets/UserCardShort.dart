import 'package:flutter/material.dart';

class UserCardShort extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String age;
  final String profession;
  final String occupation;
  final int photosCount;
  final String city;
  final VoidCallback onTap;

  UserCardShort({
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
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFe9e9f5), // Цвет бордера
              width: 1.0, // Толщина бордера
            ),
          ),
        ),
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // Убираем закругленные углы
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl),
                    radius: 40,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$name, $age',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('$profession, $occupation'),
                      Text('$photosCount фото · $city'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
