// base_users_block.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/data/user/user_state.dart';
import 'package:linkyou/core/enums/user_status_enum.dart';
import 'package:linkyou/views/widgets/controlls/circular_progress_blue.dart';

abstract class BaseUsersBlock extends StatefulWidget {
  const BaseUsersBlock({super.key});
}

abstract class BaseUsersBlockState<T extends BaseUsersBlock,
    VM extends ChangeNotifier> extends State<T> {
  late VM viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeData();
    });
  }

  void initializeData();

  Widget buildLoadingState() {
    return const CircularProgressBlue();
  }

  Widget buildErrorState(String? errorMessage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (errorMessage != null)
            Text(
              'Error: $errorMessage',
              style: const TextStyle(color: Colors.red),
            ),
          ElevatedButton(
            onPressed: onRefreshPressed,
            child: const Text('Обновить'),
          ),
        ],
      ),
    );
  }

  Widget buildLoadedState(UserState state);
  void onRefreshPressed();

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<VM>(context, listen: true);
    final state = getState();

    switch (state.status) {
      case UserStatus.initial:
      case UserStatus.loading:
        return buildLoadingState();
      case UserStatus.loaded:
      case UserStatus.loadingMore:
      case UserStatus.end:
        return buildLoadedState(state);
      case UserStatus.error:
        return buildErrorState(state.errorMessage);
    }
  }

  UserState getState();
}
