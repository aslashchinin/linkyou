import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/views/widgets/tiles/user_short_tile.dart';
import 'package:linkyou/core/enums/user_status_enum.dart';
import 'package:linkyou/core/base/users_block_base.dart';
import 'package:linkyou/data/user/user_state.dart';
import 'users_daily_viewmodel.dart';

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
            child: ElevatedButton(
              onPressed: () => viewModel.loadMoreUsers(),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xFFecf4ff), // Синий цвет фона кнопки                
              ),
              child: const Text('Загрузить еще', style: TextStyle(color: Colors.blue)),
            ),
          );
        }
        final user = state.users[index];
        return UserShortTile(
          user: user,
          onTap: () => viewModel.onUserTap(user),
        );
      },
    );
  }
}
