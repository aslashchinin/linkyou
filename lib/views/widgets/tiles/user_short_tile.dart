import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user_short.dart';

class UserShortTile extends StatelessWidget {
  const UserShortTile({required this.user, required this.onTap, super.key});

  final UserShort user;
  final VoidCallback onTap;

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
                    backgroundImage: NetworkImage(user.avatar.src.small),
                    radius: 40,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user.name}, ${user.birthday.age}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${user.job.profession}, ${user.job.occupation}'),
                      Row(
                        children: [
                          // Иконка фото
                          const Icon(Icons.camera_alt,
                              size: 16), // Иконка фото (с размером)
                          const SizedBox(
                              width: 4), // Пробел между иконкой и текстом
                          Text('${user.photosCount} фото ·'),

                          const SizedBox(
                              width: 8), // Пробел между разными частями текста

                          // Иконка локации
                          const Icon(Icons.location_on,
                              size: 16), // Иконка локации (с размером)
                          const SizedBox(
                              width: 4), // Пробел между иконкой и текстом
                          Text(user.location.cityName),
                        ],
                      ),
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
