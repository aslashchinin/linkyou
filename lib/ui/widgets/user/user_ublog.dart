import 'package:flutter/material.dart';
import 'package:linkyou/models/ublog_post.dart';
import 'package:linkyou/core/helpers/pluralizer_helper.dart';
import 'package:linkyou/ui/widgets/tiles/ublog_tile.dart';
import 'package:linkyou/ui/widgets/controlls/round_button.dart';

class UserUblog extends StatelessWidget {
  const UserUblog(
      {super.key, required this.ublogPost, required this.ublogsCount});

  final UblogPost ublogPost;
  final int ublogsCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.article, color: Colors.grey[700]),
              const SizedBox(width: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Блог',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    PluralizerHelper.getCount(
                        ublogsCount, 'запись', 'записи', 'записей'),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          UblogTile(ublogPost: ublogPost),
          const SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: 200,
              child: RoundButton(
                text: 'Все записи',
                isBlue: true,
                onPressed: () => Navigator.pushNamed(context, '/ublogs'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
