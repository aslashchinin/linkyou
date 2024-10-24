import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'top_users_viewmodel.dart';
import 'package:linkyou/data/user/user_state.dart';
import 'package:linkyou/views/widgets/tiles/user_short_tile.dart';
import 'package:linkyou/core/enums/gender_enum.dart';

class TopUsersListBlock extends StatefulWidget {
  const TopUsersListBlock({super.key, this.gender = Gender.female});

  final Gender gender;

  @override
  _TopUsersListBlockState createState() => _TopUsersListBlockState();
}

class _TopUsersListBlockState extends State<TopUsersListBlock> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TopUsersViewModel>().clearState();
      context.read<TopUsersViewModel>().loadTopUsers(gender: widget.gender);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TopUsersViewModel>();
    final state = viewModel.state;

    switch (state.status) {
      case UserStatus.initial:
      case UserStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case UserStatus.loaded:
        return ListView.builder(
          itemCount: state.users.length + 1,
          itemBuilder: (context, index) {
            if (index == state.users.length) {
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
      case UserStatus.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Error: ${state.errorMessage}',
                style: const TextStyle(color: Colors.red),
              ),
              ElevatedButton(
                onPressed: () => viewModel.loadTopUsers(gender: widget.gender),
                child: const Text('Обновить'),
              ),
            ],
          ),
        );
    }
  }
}
