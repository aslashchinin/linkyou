import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
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
