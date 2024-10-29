import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'new_users_viewmodel.dart';
import 'package:linkyou/views/widgets/tiles/user_short_tile.dart';
import 'package:linkyou/core/enums/user_status_enum.dart';
import 'package:linkyou/core/base/users_block_base.dart';
import 'package:linkyou/data/user/user_state.dart';

class NewUsersBlock extends BaseUsersBlock {
  const NewUsersBlock({super.key});

  @override
  NewUsersBlockState createState() => NewUsersBlockState();
}

class NewUsersBlockState
    extends BaseUsersBlockState<NewUsersBlock, NewUsersViewModel> {
  @override
  void initializeData() {
    Provider.of<NewUsersViewModel>(context, listen: false).loadNewUsers();
  }

  @override
  void onRefreshPressed() {
    viewModel.loadNewUsers();
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
            onPressed: () => viewModel.loadMoreUsers(),
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
