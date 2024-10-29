import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'users_top_viewmodel.dart';
import 'package:linkyou/views/widgets/tiles/user_short_tile.dart';
import 'package:linkyou/core/enums/gender_enum.dart';
import 'package:linkyou/core/enums/user_status_enum.dart';
import 'package:linkyou/core/base/users_block_base.dart';
import 'package:linkyou/data/user/user_state.dart';
import 'package:linkyou/views/widgets/buttons/round_button.dart';
class TopUsersListBlock extends BaseUsersBlock {
  final Gender gender;

  const TopUsersListBlock({super.key, this.gender = Gender.female});

  @override
  TopUsersListBlockState createState() => TopUsersListBlockState();
}

class TopUsersListBlockState
    extends BaseUsersBlockState<TopUsersListBlock, UsersTopViewModel> {
  @override
  void initializeData() {
    final viewModel = Provider.of<UsersTopViewModel>(context, listen: false);
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
        final user = state.users[index];
        return UserShortTile(
          user: user,
          onTap: () => viewModel.onUserTap(user),
        );
      },
    );
  }
}
