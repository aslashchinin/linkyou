import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'top_users_viewmodel.dart';
import 'package:linkyou/data/user/user_state.dart';
import 'package:linkyou/views/widgets/tiles/user_short_tile.dart';
import 'package:linkyou/core/enums/gender_enum.dart';
import 'package:linkyou/views/widgets/headers/block_header.dart';

class TopUsersSliderBlock extends StatefulWidget {
  const TopUsersSliderBlock({super.key, required this.gender});

  final Gender gender;

  @override
  _TopUsersSliderBlockState createState() => _TopUsersSliderBlockState();
}

class _TopUsersSliderBlockState extends State<TopUsersSliderBlock> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const BlockHeader(title: 'Лучшие 100'),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 350,
              child: PageView.builder(
                itemCount: (state.users.length / 3).ceil(),
                itemBuilder: (context, pageIndex) {
                  final startIndex = pageIndex * 3;
                  final endIndex =
                      (startIndex + 3).clamp(0, state.users.length);
                  final users = state.users.sublist(startIndex, endIndex);
                  return Column(
                    children: users
                        .map((user) => UserShortTile(
                              user: user,
                              onTap: () => viewModel.onUserTap(user),
                            ))
                        .toList(),
                  );
                },
              ),
            ),
          ],
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
                onPressed: () => viewModel.loadTopUsers(),
                child: const Text('Обновить'),
              ),
            ],
          ),
        );
    }
  }
}
