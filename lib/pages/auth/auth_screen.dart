import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_viewmodel.dart';
import 'package:linkyou/ui/blocks/form_registration/form_registration_block.dart';
import 'package:linkyou/ui/blocks/form_login/form_login_block.dart';

class AuthScreen extends StatefulWidget {
  final int initialTab;

  const AuthScreen({super.key, required this.initialTab});

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen>
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
    final viewModel = Provider.of<AuthViewModel>(context);
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
            onPressed: () => viewModel.close(context),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          FormLoginBlock(),
          FormRegistrationBlock(),
        ],
      ),
    );
  }
}
