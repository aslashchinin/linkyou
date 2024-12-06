import 'package:flutter/material.dart';
import 'package:linkyou/models/user.dart';
import 'package:linkyou/core/helpers/build_helper.dart';
class UserInterests extends StatelessWidget {
  final User user;

  const UserInterests({super.key, required this.user});

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
                Icon(Icons.star_border, color: Colors.grey[700]),
                const SizedBox(width: 8),
                const Text(
                  'Интересы',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 5.0,
              runSpacing: 3.0,
              children: user.interests?.interests
                      .map((interest) => BuildHelper.buildInfo(interest))
                      .toList() ??
                  [],
            ),
          ],
        ));
  }
}
