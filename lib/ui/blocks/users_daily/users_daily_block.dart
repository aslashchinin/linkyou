import 'package:flutter/material.dart';
import 'package:linkyou/core/enums/common_loading_enum.dart';
import 'package:linkyou/models/user_short.dart';
import 'package:linkyou/ui/widgets/tiles/user_short_tile.dart';
import 'package:linkyou/core/base/block_base.dart';
import 'users_daily_viewmodel.dart';
import 'package:linkyou/ui/widgets/controlls/round_button.dart';
import 'package:linkyou/core/base/state_base.dart';

class UsersDailyBlock extends BlockBase<UsersDailyBlock> {
  const UsersDailyBlock({super.key});

  @override
  UsersDailyBlockState createState() => UsersDailyBlockState();
}

class UsersDailyBlockState
    extends BlockBaseState<UsersDailyBlock, UsersDailyViewModel, UserShort> {
  @override
  void initializeData() {
    viewModel.loadDailyUsers();
  }

  @override
  void onRefreshPressed() {
    viewModel.loadDailyUsers();
  }

  @override
  StateBase<UserShort> getState() => viewModel.state;

  @override
  Widget buildLoadedState(StateBase<UserShort> state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.items.length + 1,
      itemBuilder: (context, index) {
        if (index == state.items.length) {
          if (state.status == CommonLoadingStatus.loadingMore) {
            return buildLoadingState();
          }
          if (state.status == CommonLoadingStatus.end) {
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
        final user = state.items[index];
        return UserShortTile(
          user: user,
        );
      },
    );
  }
}
