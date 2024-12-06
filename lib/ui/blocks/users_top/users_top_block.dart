import 'package:flutter/material.dart';
import 'users_top_viewmodel.dart';
import 'package:linkyou/ui/widgets/tiles/user_short_tile.dart';
import 'package:linkyou/core/enums/gender_enum.dart';
import 'package:linkyou/core/base/block_base.dart';
import 'package:linkyou/ui/widgets/controlls/round_button.dart';
import 'package:linkyou/models/user_short.dart';
import 'package:linkyou/core/base/state_base.dart';
import 'package:linkyou/core/enums/common_loading_enum.dart';

class UsersTopBlock extends BlockBase<UsersTopBlock> {
  final Gender gender;

  const UsersTopBlock({super.key, this.gender = Gender.female});

  @override
  TopUsersListBlockState createState() => TopUsersListBlockState();
}

class TopUsersListBlockState
    extends BlockBaseState<UsersTopBlock, UsersTopViewModel, UserShort> {
  @override
  void initializeData() {
    viewModel.clearState();
    viewModel.loadTopUsers(gender: widget.gender);
  }

  @override
  void onRefreshPressed() {
    viewModel.loadTopUsers(gender: widget.gender);
  }

  @override
  BaseState<UserShort> getState() => viewModel.state;

  @override
  Widget buildLoadedState(BaseState<UserShort> state) {
    return ListView.builder(
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
              onPressed: () => viewModel.loadMoreUsers(gender: widget.gender),
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
