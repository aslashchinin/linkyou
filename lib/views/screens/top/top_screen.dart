import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/views/widgets/headers/screen_title_header.dart';

class TopScreen extends ScreenBase {
  const TopScreen({super.key});
  @override
  TopScreenState createState() => TopScreenState();
}

class TopScreenState extends ScreenBaseState<TopScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget buildContent(BuildContext context) {
    return const SizedBox(
      child: Column(
        children: [
          ScreenTitleHeader(title: 'Лучшие 100'),
        ],
      ),
    );
  }
}
