import 'package:flutter/material.dart';
import '../../common/components/auth/login_tab.dart';
import '../../common/components/auth/registration_tab.dart';

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
        title: Center(
          child: SizedBox(
            width: 100,
            child: Image.asset('assets/logo-blue/logo.png'),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Вход'),
            Tab(text: 'Регистрация'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      // drawer: DrawerMenu(), // Подключение меню
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
