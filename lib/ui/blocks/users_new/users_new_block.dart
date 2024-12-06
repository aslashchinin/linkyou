import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/ui/widgets/tiles/user_short_tile.dart';
import 'package:linkyou/models/user_short.dart';
import 'package:linkyou/core/base/block_base.dart';
import 'package:linkyou/core/base/state_base.dart';
import 'package:linkyou/core/enums/common_loading_enum.dart';
import 'users_new_viewmodel.dart';

class UsersNewBlock extends BlockBase<UsersNewBlock> {
  const UsersNewBlock({super.key});

  @override
  UsersNewBlockState createState() => UsersNewBlockState();
}

class UsersNewBlockState
    extends BlockBaseState<UsersNewBlock, UsersNewViewModel, UserShort> {
  @override
  void initializeData() {
    Provider.of<UsersNewViewModel>(context, listen: false).loadNewUsers();
  }

  @override
  void onRefreshPressed() {
    viewModel.loadNewUsers();
  }

  @override
  BaseState<UserShort> getState() => viewModel.state;

  @override
  Widget buildLoadedState(BaseState<UserShort> state) {
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
          return ElevatedButton(
            onPressed: () => viewModel.loadMoreUsers(),
            child: const Text('Загрузить еще'),
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
