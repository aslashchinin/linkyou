import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/views/blocks/top_users/top_users_slider_block.dart';
import 'package:linkyou/core/enums/gender_enum.dart';

class HomeScreen extends ScreenBase {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ScreenBaseState<HomeScreen> {
  @override
  Widget buildContent(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: const SizedBox(
        child: TopUsersSliderBlock(gender: Gender.female),
      ),
    );
  }
}
