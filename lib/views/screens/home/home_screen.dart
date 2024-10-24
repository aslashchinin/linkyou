import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/views/blocks/new_users/new_users_block.dart';
import 'package:linkyou/views/widgets/headers/screen_header.dart';

class HomeScreen extends ScreenBase {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ScreenBaseState<HomeScreen> {
  @override
  Widget buildContent(BuildContext context) {
    return const Column(
      children: [
        ScreenHeader(title: 'Новые пользователи'),
        Expanded(
          child: NewUsersBlock(),
        ),
      ],
    );
  }
}
