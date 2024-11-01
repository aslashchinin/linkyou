import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user.dart';

class UserAbout extends StatelessWidget {
  final User user;

  const UserAbout({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person, color: Colors.grey[700]),
                const SizedBox(width: 8),
                const Text(
                  'Обо мне',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            user.about != null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 10),
                    child: Text(user.about!))
                : const SizedBox.shrink(),
            _buildRow('Рост', user.height != null ? '${user.height} см' : ''),
            _buildRow('Вес', user.weight != null ? '${user.weight} кг' : ''),
            _buildRow(
                'Состоите ли в отношениях', user.relationship?.name ?? ''),
            _buildRow('Ориентация', user.orientation?.name ?? ''),
            _buildRow('Дети', user.children?.name ?? ''),
            _buildRow('Отношение к курению', user.smoking?.name ?? ''),
            _buildRow('Отношение к алкоголю', user.alcohol?.name ?? ''),
          ],
        ));
  }

  Widget _buildRow(String key, String value) {
    if (value.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              key,
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              value,
              textAlign: TextAlign.right, // Выравниваем значение вправо
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
