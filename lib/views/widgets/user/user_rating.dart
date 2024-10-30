import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user.dart';
import 'package:percent_indicator/percent_indicator.dart';

class UserRating extends StatelessWidget {
  final User user;

  const UserRating({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 5.0,
            percent: user.rating.score / 10.0,
            center: Text(
              '${user.rating.score}',
              style: const TextStyle(fontSize: 20),
            ),
            progressColor: const Color(0xFF24cbf4),
            backgroundColor: const Color(0xFFe9e9f5),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Рейтинг анкеты',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Понравилась ${user.rating.likes} из ${user.rating.views}',
                  style: const TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
