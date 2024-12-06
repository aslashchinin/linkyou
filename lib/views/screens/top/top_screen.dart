import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/views/blocks/users_top/users_top_block.dart';
import 'package:linkyou/core/enums/gender_enum.dart';
import 'package:linkyou/views/blocks/layout_appbar/layout_appbar_block.dart';
import 'package:linkyou/views/widgets/headers/screen_header.dart';

class TopScreen extends ScreenBase {
  const TopScreen({super.key});

  @override
  ScreenBaseState<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends ScreenBaseState<TopScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        const ScreenHeader(title: 'Лучшие 100'),
        TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          tabs: const [
            Tab(text: 'Мужчины'),
            Tab(text: 'Женщины'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              UsersTopBlock(gender: Gender.male),
              UsersTopBlock(gender: Gender.female),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get showDrawer => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const LayoutAppBarBlock(showStarIcon: false);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
