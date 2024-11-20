import 'package:flutter/material.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/views/widgets/controlls/round_button.dart';
import 'package:linkyou/views/widgets/tiles/menu_item_tile.dart';
import 'package:linkyou/views/blocks/layout_menu/layout_menu_viewmodel.dart';

class LayoutUserMenuBlock extends StatelessWidget {
  const LayoutUserMenuBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final layoutMenuViewModel = Provider.of<LayoutMenuViewModel>(context);

    return Column(
      children: [
        ListTile(
          onTap: () {
            layoutMenuViewModel.userProfile(context, authProvider.user!.id);
          },
          leading: GestureDetector(
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(authProvider.user!.avatar.src.origin),
              radius: 20,
            ),
          ),
          title: Text(
              '${authProvider.user!.name}, ${authProvider.user!.birthday.age}'),
        ),
        MenuItemTile(
          title: 'Редактировать анкету',
          leading: const Icon(Icons.edit, size: 20),
          onTap: () {
            // Handle navigation
          },
        ),
        MenuItemTile(
          title: 'Мои сообщения',
          leading: const Icon(Icons.message, size: 20),
          onTap: () {
            // Handle navigation
          },
        ),
        MenuItemTile(
          title: 'Мои лайки',
          leading: const Icon(Icons.favorite, size: 20),
          onTap: () {
            // Handle navigation
          },
        ),
        MenuItemTile(
          title: 'Просмотры анкеты',
          leading: const Icon(Icons.visibility, size: 20),
          onTap: () {},
        ),
        MenuItemTile(
          title: 'Вам подходят',
          leading: const Icon(Icons.people, size: 20),
          onTap: () {
            // Handle navigation
          },
        ),
        MenuItemTile(
          title: 'Like You',
          leading: const Icon(Icons.link_rounded, size: 20),
          onTap: () {
            layoutMenuViewModel.likeYou(context);
          },
        ),
        MenuItemTile(
          title: 'Избранное',
          leading: const Icon(Icons.star, size: 20),
          onTap: () {
            // Handle navigation
          },
        ),
        MenuItemTile(
          title: 'Написать в блог',
          leading: const Icon(Icons.edit, size: 20),
          onTap: () {
            // Handle navigation
          },
        ),
        MenuItemTile(
          title: 'Настройки аккаунта',
          leading: const Icon(Icons.settings, size: 20),
          onTap: () {
            // Handle navigation
          },
        ),
        Row(
          children: [
            SizedBox(
              width: 55,
              child: Transform.scale(
                scale: 0.5,
                child: Switch(
                  activeColor: Colors.white,
                  activeTrackColor: Colors.blue,
                  value: authProvider.user!.isInvisible,
                  onChanged: (context) {},
                ),
              ),
            ),
            Text(
              'Режим невидимости',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        if (authProvider.user!.isPremium == false) ...[
          RoundButton(
            text: 'Стать премиум',
            onPressed: () {},
          )
        ],
        const Divider(),
      ],
    );
  }
}
