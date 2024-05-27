import 'package:flutter/material.dart';
import '../screens/auth/login_tab.dart';
import '../screens/auth/registration_tab.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_button.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu>
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
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    String avatarUrl = 'assets/no_avatar.png';

    if (authProvider.user != null) {
      avatarUrl = authProvider.user!['avatar']['src']['square'] ?? '';

      if (avatarUrl.isEmpty) {
        avatarUrl = authProvider.user!['avatar']['src']['default'];
      }
    }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'LINKYOU',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          if (authProvider.token == null || authProvider.user == null) ...[
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Вход'),
                Tab(text: 'Регистрация'),
              ],
            ),
            Container(
              height: 280.0,
              child: TabBarView(
                controller: _tabController,
                children: [
                  LoginTab(),
                  RegistrationTab(),
                ],
              ),
            )
          ],
          if (authProvider.token != null && authProvider.user != null) ...[
            ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/user',
                  arguments: authProvider.user!['id'],
                );
              },
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https:$avatarUrl'),
                  radius: 40,
                ),
              ),
              title: Text(
                  '${authProvider.user!['name']}, ${authProvider.user!['birthday']['age']}'),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Редактировать анкету'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Мои сообщения'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Мои лайки'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.visibility),
              title: Text('Просмотры анкеты'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Вам подходят'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Избранное'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Написать в блог'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Настройки аккаунта'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Switch(
                value: authProvider.user!['is_invisible'],
                onChanged: (context) {},
              ),
              title: Text('Режим невидимости'),
              onTap: () {
                // Handle navigation
              },
            ),
            if (authProvider.user!['is_premium'] == false) ...[
              CustomButton(
                text: 'Стать Premium',
                onPressed: () {},
                isOutlined: false,
                isBlue: true,
              )
            ],
            Divider(),
          ],
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Знакомства'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.main);
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Поиск'),
            onTap: () {
              // Navigate to the Poisk screen
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('Блоги'),
            onTap: () {
              // Navigate to the Blogi screen
            },
          ),
          ListTile(
            leading: Icon(Icons.emoji_events),
            title: Text('Лучшие-100'),
            onTap: () {
              // Navigate to the Luchshie-100 screen
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('О нас'),
            onTap: () {
              // Navigate to the O nas screen
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Наш блог'),
            onTap: () {
              // Navigate to the Nash blog screen
            },
          ),
        ],
      ),
    );
  }
}
