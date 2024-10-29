import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'layout_menu_viewmodel.dart';
import 'package:linkyou/views/blocks/form_login/form_login_block.dart';
import 'package:linkyou/views/blocks/form_registration/form_registration_block.dart';

class LayoutMenuBlock extends StatefulWidget {
  const LayoutMenuBlock({super.key});

  @override
  _LayoutMenuBlockState createState() => _LayoutMenuBlockState();
}

class _LayoutMenuBlockState extends State<LayoutMenuBlock>
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
    final viewModel = Provider.of<LayoutMenuViewModel>(context);
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
            height: 300.0,
            child: TabBarView(
              controller: _tabController,
              children: const [
                FormLoginBlock(),
                FormRegistrationBlock(),
              ],
            ),
          ),
          const Divider(
            color: Color(0xFFe9e9f5),
            height: 1,
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
