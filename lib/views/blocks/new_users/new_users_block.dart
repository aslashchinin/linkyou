import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'new_users_viewmodel.dart';
import 'package:linkyou/views/widgets/tiles/user_short_tile.dart';
import 'package:linkyou/core/enums/user_status_enum.dart';

class NewUsersBlock extends StatefulWidget {
  const NewUsersBlock({super.key});

  @override
  _NewUsersBlockState createState() => _NewUsersBlockState();
}

class _NewUsersBlockState extends State<NewUsersBlock> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewUsersViewModel>().loadNewUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NewUsersViewModel>();
    final state = viewModel.state;

    switch (state.status) {
      case UserStatus.initial:
      case UserStatus.loading:
      case UserStatus.end:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case UserStatus.loaded:
      case UserStatus.loadingMore:
        return ListView.builder(
          itemCount: state.users.length + 1,
          itemBuilder: (context, index) {
            if (index == state.users.length) {
              if (state.status == UserStatus.loadingMore) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
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
      case UserStatus.error:
        return Center(
          child: Text(state.errorMessage ?? ''),
        );
    }
  }
}
