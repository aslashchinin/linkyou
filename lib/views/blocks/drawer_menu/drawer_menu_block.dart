import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'drawer_menu_viewmodel.dart';
import 'package:linkyou/views/blocks/login/login_block.dart';
import 'package:linkyou/views/blocks/registration/registration_block.dart';

class DrawerMenuBlock extends StatefulWidget {
  const DrawerMenuBlock({super.key});

  @override
  _DrawerMenuBlockState createState() => _DrawerMenuBlockState();
}

class _DrawerMenuBlockState extends State<DrawerMenuBlock>
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
    final viewModel = Provider.of<DrawerMenuViewModel>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Image.asset('assets/logo/logo.png'),
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Вход'),
              Tab(text: 'Регистрация'),
            ],
          ),
          SizedBox(
            height: 290.0,
            child: TabBarView(
              controller: _tabController,
              children: const [
                LoginBlock(),
                RegistrationBlock(),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Знакомства'),
            onTap: () => viewModel.home(context),
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Поиск'),
            onTap: () => viewModel.search(context),
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('Блоги'),
            onTap: () => viewModel.blogs(context),
          ),
          ListTile(
            leading: const Icon(Icons.emoji_events),
            title: const Text('Лучшие-100'),
            onTap: () => viewModel.top(context),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('О нас'),
            onTap: () => viewModel.about(context),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Наш блог'),
            onTap: () => viewModel.blog(context),
          ),
        ],
      ),
    );
  }
}
