import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../routes.dart';
import '../widgets/RoundedButton.dart';
import '../providers/auth_provider.dart';
import '../components/auth/login_tab.dart';
import '../components/auth/registration_tab.dart';

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
      // Проверяем, есть ли у пользователя данные
      var userAvatar = authProvider.user!['avatar'];
      if (userAvatar != null) {
        avatarUrl = userAvatar['src']?['square'] ??
            userAvatar['src']?['default'] ??
            avatarUrl;
      }
    }

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
              leading: const Icon(Icons.message),
              title: const Text('Мои сообщения'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Мои лайки'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.visibility),
              title: const Text('Просмотры анкеты'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Вам подходят'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Избранное'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Написать в блог'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Настройки аккаунта'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Switch(
                value: authProvider.user!['is_invisible'],
                onChanged: (context) {},
              ),
              title: const Text('Режим невидимости'),
              onTap: () {
                // Handle navigation
              },
            ),
            if (authProvider.user!['is_premium'] == false) ...[
              RoundedButton(
                text: 'Стать премиум',
                onPressed: () {},
              )
            ],
            const Divider(),
          ],
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Знакомства'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.main);
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Поиск'),
            onTap: () {
              // Navigate to the Poisk screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('Блоги'),
            onTap: () {
              // Navigate to the Blogi screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.emoji_events),
            title: const Text('Лучшие-100'),
            onTap: () {
              // Navigate to the Luchshie-100 screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('О нас'),
            onTap: () {
              // Navigate to the O nas screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Наш блог'),
            onTap: () {
              // Navigate to the Nash blog screen
            },
          ),
        ],
      ),
    );
  }
}
