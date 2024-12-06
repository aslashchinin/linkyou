import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/ui/containers/users_daily/users_daily_container.dart';
import 'package:linkyou/ui/blocks/users_top/users_top_slider_block.dart';
import 'package:linkyou/ui/blocks/users_new/users_new_slider_block.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UsersDailyContainer(),
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  height: 1.0,
                  color: const Color(0xFFe9e9f5),
                ),
                Container(
                  height: 200,
                  alignment: Alignment.center,
                  color: const Color(0xFFf6f8fb),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Как продвинуть вашу анкету и узнать свою судьбу',
                          textAlign: TextAlign
                              .center, // Дополнительно выравниваем текст по центру
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, elevation: 0),
                          child: const Text('Узнать как',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 1.0, // Высота нижнего бордюра
                  color: const Color(0xFFe9e9f5),
                ),
              ],
            ),
            const UsersNewSliderBlock(),
            Column(
              children: [
                Container(
                  height: 1.0, // Высота верхнего бордюра
                  color: const Color(0xFFe9e9f5),
                ),
                Container(
                  height: 20, // Заданная высота разделителя
                  color: const Color(0xFFf6f8fb),
                ),
                Container(
                  height: 1.0, // Высота нижнего бордюра
                  color: const Color(0xFFe9e9f5),
                ),
              ],
            ),
            const UsersTopSliderBlock(),
          ],
        ),
      ),
    );
  }
}
