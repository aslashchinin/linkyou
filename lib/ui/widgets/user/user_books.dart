import 'package:flutter/material.dart';
import 'package:linkyou/core/helpers/build_helper.dart';
import 'package:linkyou/models/user.dart';
  
class UserBooks extends StatelessWidget {
  final User user;

  const UserBooks({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.book, color: Colors.grey[700]),
              const SizedBox(width: 8),
              const Text(
                'Любимые книги',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...user.books!
              .asMap()
              .entries
              .map((entry) =>
              BuildHelper.buildRow(entry.value.name, entry.value.author))
        ],
      ),
    );
  }
}
