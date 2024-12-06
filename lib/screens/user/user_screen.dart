import 'package:flutter/material.dart';
import 'package:linkyou/views/blocks/users_daily/users_daily_slider_block.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/screens/user/user_viewmodel.dart';
import 'package:linkyou/views/blocks/layout_appbar/layout_appbar_block.dart';
import 'package:linkyou/views/widgets/user/user_avatar.dart';
import 'package:linkyou/views/widgets/user/user_action_buttons.dart';
import 'package:linkyou/views/widgets/user/user_stat_info.dart';
import 'package:linkyou/views/widgets/user/user_tags.dart';
import 'package:linkyou/views/widgets/user/user_rating.dart';
import 'package:linkyou/views/widgets/controlls/circular_progress_blue.dart';
import 'package:linkyou/views/widgets/controlls/block_divider.dart';
import 'package:linkyou/views/blocks/user_photos/user_photo_block.dart';
import 'package:linkyou/views/widgets/user/user_gifts.dart';
import 'package:linkyou/views/widgets/user/user_about.dart';
import 'package:linkyou/views/widgets/user/user_interests.dart';
import 'package:linkyou/views/widgets/user/user_education.dart';
import 'package:linkyou/views/widgets/user/user_books.dart';
import 'package:linkyou/views/widgets/user/user_job.dart';
import 'package:linkyou/views/widgets/user/user_pets.dart';
import 'package:linkyou/views/widgets/user/user_ublog.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:linkyou/core/services/locator_service.dart';
import 'package:share_plus/share_plus.dart';

class UserScreen extends ScreenBase {
  const UserScreen({super.key, required this.userId});
  final BigInt userId;
  @override
  UserScreenState createState() => UserScreenState();
}

class UserScreenState extends ScreenBaseState<UserScreen> {
  BigInt? _lastUserId;

  BigInt? get lastUserId => _lastUserId;

  void setLastUserId(BigInt userId) {
    _lastUserId = userId;
  }

  @override
  void initState() {
    super.initState();
    Provider.of<UserViewModel>(context, listen: false)
        .loadUser(widget.userId);
  }

  @override
  void didUpdateWidget(covariant UserScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (lastUserId != widget.userId) {
      Provider.of<UserViewModel>(context, listen: false)
          .loadUser(widget.userId);
    }
  }

  @override
  Widget buildContent(BuildContext context) {
    final viewModel = Provider.of<UserViewModel>(context);
    final authProvider = serviceLocator<AuthProvider>();

    setLastUserId(viewModel.user?.id ?? BigInt.zero);

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
                const BlockDivider(),
                UserPhotoBlock(user: viewModel.user!),
                const BlockDivider(),
                UserGifts(user: viewModel.user!),                
                if (viewModel.user!.ublogPost != null &&
                    viewModel.user!.ubLogsCount > 0) ...[
                  const BlockDivider(),
                  UserUblog(
                      ublogPost: viewModel.user!.ublogPost!,
                      ublogsCount: viewModel.user!.ubLogsCount),
                ],
                if (viewModel.user!.about != null) ...[
                  const BlockDivider(),
                  UserAbout(user: viewModel.user!),
                ],
                if (viewModel.user!.interests?.interests.isNotEmpty ??
                    false) ...[
                  const BlockDivider(),
                  UserInterests(user: viewModel.user!),
                ],
                if (viewModel.user!.education != null) ...[
                  const BlockDivider(),
                  UserEducation(user: viewModel.user!),
                ],
                if (viewModel.user!.job != null) ...[
                  const BlockDivider(),
                  UserJob(user: viewModel.user!),
                ],
                if (viewModel.user!.books != null &&
                    viewModel.user!.books!.isNotEmpty) ...[
                  const BlockDivider(),
                  UserBooks(user: viewModel.user!),
                ],
                if (viewModel.user!.pets != null &&
                    viewModel.user!.pets!.isNotEmpty) ...[
                  const BlockDivider(),
                  UserPets(user: viewModel.user!),
                ],
                // Временно отключено
                // if (viewModel.user!.music != null &&
                //     viewModel.user!.music!.isNotEmpty) ...[
                //   const BlockDivider(),
                //   UserMusic(user: viewModel.user!),
                // ],
                if (authProvider.user != null &&
                    authProvider.user!.id != viewModel.user!.id) ...[
                  const BlockDivider(),
                  const UsersDailySliderBlock(),
                ],
              ],
            ),
          );
  }

  @override
  bool get showDrawer => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    final viewModel = Provider.of<UserViewModel>(context, listen: false);
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
                    leading: const Icon(Icons.share),
                    title: const Text('Поделиться профилем'),
                    onTap: () {
                      Share.share(
                          'https://linkyou.ru/user/${viewModel.user!.id}',
                          subject: 'Поделиться профилем!');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.report, color: Colors.red),
                    title: const Text('Пожаловаться',
                        style: TextStyle(color: Colors.red)),
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
