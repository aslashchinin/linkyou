import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/views/containers/users_daily/users_daily_container.dart';
import 'package:linkyou/views/blocks/users_top/users_top_slider_block.dart';
import 'package:linkyou/views/blocks/users_new/users_new_slider_block.dart';

class HomeScreen extends ScreenBase {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ScreenBaseState<HomeScreen> {
  @override
  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UsersDailyContainer(),
            SizedBox(height: 10),
            SizedBox(child: UsersNewSliderBlock()),
            SizedBox(height: 10),
            SizedBox(child: UsersTopSliderBlock()),
          ],
        ),
      ),
    );
  }
}
