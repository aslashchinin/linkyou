import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user.dart';

class UserRating extends StatelessWidget {
  final User user;

  const UserRating({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Text('Yes');
  }
}
