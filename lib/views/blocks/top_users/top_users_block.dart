import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'top_users_viewmodel.dart';
import 'package:linkyou/data/user/user_state.dart';

class TopUsersBlock extends StatefulWidget {
  const TopUsersBlock({super.key});

  @override
  _TopUsersBlockState createState() => _TopUsersBlockState();
}

class _TopUsersBlockState extends State<TopUsersBlock> {
  void initState() {
    super.initState();
    // Загружаем данные при инициализации
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TopUsersViewModel>().loadTopUsers();
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
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.users.length,
          itemBuilder: (context, index) {
            final user = state.users[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.avatar.src.small),
              ),
              title: Text(user.name),
              subtitle:
                  Text('${user.birthday.age} лет, ${user.location.cityName}'),
              trailing: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: user.isOnline ? Colors.green : Colors.grey,
                ),
              ),
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
                onPressed: () => viewModel.loadTopUsers(),
                child: const Text('Retry'),
              ),
            ],
          ),
        );
    }
  }
}
