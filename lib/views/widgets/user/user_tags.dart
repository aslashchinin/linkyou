import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user.dart';
import 'package:linkyou/views/widgets/controlls/round_text.dart';

class UserTags extends StatelessWidget {
  const UserTags({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            user.birthday.zodiac?.name != null
                ? RoundText(text: user.birthday.zodiac!.name)
                : const SizedBox.shrink(),
            user.nationality?.name != null
                ? RoundText(text: user.nationality!.name)
                : const SizedBox.shrink(),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            RoundText(
                text:
                    'Ищу ${user.lookingFor.name} от ${user.age.from} до ${user.age.to}'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            RoundText(text: user.religion?.status ?? ''),
            RoundText(text: 'Цель: ${user.goal.name}'),
          ],
        ),
      ],
    );
  }
}
