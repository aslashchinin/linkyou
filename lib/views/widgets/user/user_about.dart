import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user.dart';
import 'package:linkyou/core/helpers/build_helper.dart';
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
            BuildHelper.buildRow(
                'Рост', user.height != null ? '${user.height} см' : ''),
            BuildHelper.buildRow(
                'Вес', user.weight != null ? '${user.weight} кг' : ''),
            BuildHelper.buildRow(
                'Состоите ли в отношениях', user.relationship?.name ?? ''),
            BuildHelper.buildRow('Ориентация', user.orientation?.name ?? ''),
            BuildHelper.buildRow('Дети', user.children?.name ?? ''),
            BuildHelper.buildRow(
                'Отношение к курению', user.smoking?.name ?? ''),
            BuildHelper.buildRow(
                'Отношение к алкоголю', user.alcohol?.name ?? ''),
          ],
        ));
  }
}
