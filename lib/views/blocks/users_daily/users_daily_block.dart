import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/views/widgets/tiles/user_short_tile.dart';
import 'package:linkyou/core/enums/user_status_enum.dart';
import 'package:linkyou/core/base/users_block_base.dart';
import 'package:linkyou/data/user/user_state.dart';
import 'users_daily_viewmodel.dart';
import 'package:linkyou/views/widgets/controlls/round_button.dart';

class UsersDailyBlock extends BaseUsersBlock {
  const UsersDailyBlock({super.key});

  @override
  UsersDailyBlockState createState() => UsersDailyBlockState();
}

class UsersDailyBlockState
    extends BaseUsersBlockState<UsersDailyBlock, UsersDailyViewModel> {
  @override
  void initializeData() {
    Provider.of<UsersDailyViewModel>(context, listen: false).loadDailyUsers();
  }

  @override
  void onRefreshPressed() {
    viewModel.loadDailyUsers();
  }

  @override
  UserState getState() => viewModel.state;

  @override
  Widget buildLoadedState(UserState state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.users.length + 1,
      itemBuilder: (context, index) {
        if (index == state.users.length) {
          if (state.status == UserStatus.loadingMore) {
            return buildLoadingState();
          }
          if (state.status == UserStatus.end) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: RoundButton(
              text: 'Загрузить еще',
              isBlue: true,
              isOutlined: false,
              onPressed: () => viewModel.loadMoreUsers(),
            ),
          );
        }
        final user = state.users[index];
        return UserShortTile(
          user: user,
        );
      },
    );
  }
}
