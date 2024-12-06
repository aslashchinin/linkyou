import 'package:flutter/material.dart';
import 'package:linkyou/models/user.dart';
import 'package:linkyou/core/helpers/build_helper.dart';

class UserEducation extends StatelessWidget {
  final User user;

  const UserEducation({super.key, required this.user});

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
                Icon(Icons.school, color: Colors.grey[700]),
                const SizedBox(width: 8),
                const Text(
                  'Образование',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            user.education != null
                ? Column(
                    children: user.education!
                        .map(BuildHelper.buildEducation)
                        .toList(),
                  )
                : const SizedBox.shrink(),
            user.languages.isNotEmpty
                ? Column(
                    children: user.languages
                        .asMap()
                        .entries
                        .map((entry) => BuildHelper.buildLanguage(
                            entry.value, entry.key == 0))
                        .toList(),
                  )
                : const SizedBox.shrink(),
          ],
        ));
  }
}
