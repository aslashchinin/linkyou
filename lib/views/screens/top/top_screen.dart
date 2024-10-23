import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/views/blocks/top_users/top_users_block.dart';
import 'package:linkyou/core/enums/gender_enum.dart';
import 'package:linkyou/views/blocks/app_bar/app_bar_block.dart';
import 'package:linkyou/views/widgets/headers/screen_title_header.dart';

class TopScreen extends StatefulWidget {
  const TopScreen({super.key});

  @override
  _TopScreenState createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarBlock(),
      body: Column(
        children: [
          const ScreenTitleHeader(title: 'Лучшие 100'),
          Align(
            alignment:
                Alignment.centerRight, // Выровнять вкладки по правому краю
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.blue,
              tabs: const [
                Tab(text: 'Мужчины'),
                Tab(text: 'Женщины'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                TopUsersBlock(gender: Gender.male),
                TopUsersBlock(gender: Gender.female),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
