import 'package:flutter/material.dart';
import 'package:linkyou/models/user.dart';
import 'package:linkyou/core/helpers/build_helper.dart';
class UserJob extends StatelessWidget {
  final User user;

  const UserJob({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.work, color: Colors.grey[700]),
              const SizedBox(width: 8),
              const Text(
                'Карьера',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          BuildHelper.buildRow(
              'Моя должность / профессия', user.job?.profession ?? ''),
          BuildHelper.buildRow(
              'Профессиональная область', user.job?.occupation ?? ''),
          BuildHelper.buildRow(
              'Работаю в компании', user.job?.companyName ?? ''),
          BuildHelper.buildRow(
              'Материальное положение', user.job?.finance.name ?? ''),
        ],
      ),
    );
  }
}
