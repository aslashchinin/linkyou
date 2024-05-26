import 'package:flutter/material.dart';
import 'login_tab.dart';
import 'registration_tab.dart';
import 'package:linkyou/components/drawer_menu.dart';

class AuthScreen extends StatefulWidget {
  final int initialTab;

  AuthScreen({required this.initialTab});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: widget.initialTab);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LINKYOU'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Вход'),
            Tab(text: 'Регистрация'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      drawer: DrawerMenu(), // Подключение меню
      body: TabBarView(
        controller: _tabController,
        children: [
          LoginTab(),
          RegistrationTab(),
        ],
      ),
    );
  }
}
