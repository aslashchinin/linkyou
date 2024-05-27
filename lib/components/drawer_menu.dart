import 'package:flutter/material.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    String avatarUrl = authProvider.user!['avatar']['src']['square'];
    if (avatarUrl.isEmpty) {
      avatarUrl = authProvider.user!['avatar']['src']['default'];
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
          if (authProvider.token != null && authProvider.user != null) ...[
            ListTile(
              leading: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https:${avatarUrl}'),
                  radius: 40,
                ),
              ),
              title: Text(
                  '${authProvider.user!['name']}, ${authProvider.user!['birthday']['age']}'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Редактировать анкету'),
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
              leading: Icon(Icons.visibility_off),
              title: Text('Режим невидимости'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.star_border),
              title: Text('Стать Premium'),
              onTap: () {
                // Handle navigation
              },
            ),
            Divider(),
          ],
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Знакомства'),
            onTap: () {
              // Navigate to the Znakomstva screen
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
