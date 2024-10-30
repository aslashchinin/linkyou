import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'layout_menu_viewmodel.dart';
import 'package:linkyou/views/blocks/form_login/form_login_block.dart';
import 'package:linkyou/views/blocks/form_registration/form_registration_block.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:linkyou/views/blocks/layout_user_menu/layout_user_menu_block.dart';
import 'package:linkyou/views/widgets/tiles/menu_item_tile.dart';

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
    final authProvider = Provider.of<AuthProvider>(context, listen: true);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Image.asset('assets/logo/logo.png'),
            ),
          ),
          !authProvider.isAuthenticated
              ? TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Вход'),
                    Tab(text: 'Регистрация'),
                  ],
                )
              : const SizedBox(),
          !authProvider.isAuthenticated
              ? SizedBox(
                  height: 300.0,
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      FormLoginBlock(),
                      FormRegistrationBlock(),
                    ],
                  ),
                )
              : const LayoutUserMenuBlock(),
          const Divider(
            color: Color(0xFFe9e9f5),
            height: 1,
          ),
          MenuItemTile(
            leading: const Icon(Icons.home, size: 20),
            title: 'Знакомства',
            onTap: () => viewModel.home(context),
          ),
          MenuItemTile(
            leading: const Icon(Icons.search, size: 20),
            title: 'Поиск',
            onTap: () => viewModel.search(context),
          ),
          MenuItemTile(
            leading: const Icon(Icons.article, size: 20),
            title: 'Блоги',
            onTap: () => viewModel.blogs(context),
          ),
          MenuItemTile(
            leading: const Icon(Icons.emoji_events, size: 20),
            title: 'Лучшие-100',
            onTap: () => viewModel.top(context),
          ),
          MenuItemTile(
            leading: const Icon(Icons.info, size: 20),
            title: 'О нас',
            onTap: () => viewModel.about(context),
          ),
          MenuItemTile(
            leading: const Icon(Icons.edit, size: 20),
            title: 'Наш блог',
            onTap: () => viewModel.blog(context),
          ),
          authProvider.isAuthenticated
              ? MenuItemTile(
                  leading: const Icon(Icons.logout, size: 20),
                  title: 'Выйти',
                  onTap: () => viewModel.logout(context),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
