import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';

class HomeScreen extends ScreenBase {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ScreenBaseState<HomeScreen> {
  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        Text('Home Screen'),
      ],
    );
  }
}
