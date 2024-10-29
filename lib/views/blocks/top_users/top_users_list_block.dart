import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'top_users_viewmodel.dart';
import 'package:linkyou/views/widgets/tiles/user_short_tile.dart';
import 'package:linkyou/core/enums/gender_enum.dart';
import 'package:linkyou/core/enums/user_status_enum.dart';
import 'package:linkyou/core/base/users_block_base.dart';
import 'package:linkyou/data/user/user_state.dart';

class TopUsersListBlock extends BaseUsersBlock {
  final Gender gender;

  const TopUsersListBlock({super.key, this.gender = Gender.female});

  @override
  TopUsersListBlockState createState() => TopUsersListBlockState();
}

class TopUsersListBlockState
    extends BaseUsersBlockState<TopUsersListBlock, TopUsersViewModel> {
  @override
  void initializeData() {
    final viewModel = Provider.of<TopUsersViewModel>(context, listen: false);
    viewModel.clearState();
    viewModel.loadTopUsers(gender: widget.gender);
  }

  @override
  void onRefreshPressed() {
    viewModel.loadTopUsers(gender: widget.gender);
  }

  @override
  UserState getState() => viewModel.state;

  @override
  Widget buildLoadedState(UserState state) {
    return ListView.builder(
      itemCount: state.users.length + 1,
      itemBuilder: (context, index) {
        if (index == state.users.length) {
          if (state.status == UserStatus.loadingMore) {
            return buildLoadingState();
          }
          if (state.status == UserStatus.end) {
            return const SizedBox.shrink();
          }
          return ElevatedButton(
            onPressed: () => viewModel.loadMoreUsers(gender: widget.gender),
            child: const Text('Загрузить еще'),
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
