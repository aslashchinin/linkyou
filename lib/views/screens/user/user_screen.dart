import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/views/screens/user/user_viewmodel.dart';
import 'package:linkyou/views/blocks/layout_appbar/layout_appbar_block.dart';
import 'package:linkyou/views/widgets/user/user_avatar.dart';
import 'package:linkyou/views/widgets/user/user_action_buttons.dart';
import 'package:linkyou/views/widgets/user/user_stat_info.dart';
import 'package:linkyou/views/widgets/user/user_tags.dart';
import 'package:linkyou/views/widgets/user/user_rating.dart';
import 'package:linkyou/views/widgets/controlls/circular_progress_blue.dart';
class UserScreen extends ScreenBase {
  const UserScreen({super.key, required this.userId});
  final int userId;
  @override
  UserScreenState createState() => UserScreenState();
}

class UserScreenState extends ScreenBaseState<UserScreen> {
  int? lastUserId;

  @override
  void initState() {
    super.initState();
    Provider.of<UserViewModel>(context, listen: false).loadUser(widget.userId);
  }

  @override
  Widget buildContent(BuildContext context) {
    final viewModel = Provider.of<UserViewModel>(context);
    lastUserId = viewModel.user?.id;

    return viewModel.user == null || lastUserId != widget.userId
        ? const Center(child: CircularProgressBlue())
        : SingleChildScrollView(
            child: Column(
              children: [
                UserAvatar(
                  user: viewModel.user!,
                ),
                UserActionButtons(user: viewModel.user!),
                UserStatInfo(user: viewModel.user!),
                const Divider(
                  height: 1,
                  color: Color(0xFFe9e9f5),
                ),
                const SizedBox(height: 20),
                UserTags(user: viewModel.user!),
                const SizedBox(height: 20),
                UserRating(user: viewModel.user!),
              ],
            ),
          );
  }

  @override
  bool get showDrawer => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return LayoutAppBarBlock(
      showStarIcon: false,
      showSearchIcon: false,
      customActions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: const Text('Добавить в избранное'),
                    onTap: () {
                      // Add to favorites action
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.block),
                    title: const Text('Добавить в черный список'),
                    onTap: () {
                      // Add to blacklist action
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.report),
                    title: const Text('Пожаловаться'),
                    onTap: () {
                      // Report action
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
