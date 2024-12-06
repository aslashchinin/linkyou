import 'package:flutter/material.dart';
import 'package:linkyou/models/user.dart';
import 'package:linkyou/ui/widgets/controlls/round_button.dart';

class UserActionButtons extends StatelessWidget {
  const UserActionButtons({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: RoundButton(
            onPressed: () {},
            text: 'Сообщение',
            isBlue: true,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.blue.withOpacity(0.07),
              side: const BorderSide(color: Colors.blue),
            ),
            onPressed: () {
              // Like action
            },
            child: Row(
              children: [
                Icon(
                  user.likes.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: user.likes.isLiked ? Colors.red : Colors.blue,
                ),
                const SizedBox(width: 5),
                const Text('Лайкнуть', style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
