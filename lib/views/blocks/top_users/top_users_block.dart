import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'top_users_viewmodel.dart';

class TopUsersBlock extends StatefulWidget {
  const TopUsersBlock({super.key});

  @override
  _TopUsersBlockState createState() => _TopUsersBlockState();
}

class _TopUsersBlockState extends State<TopUsersBlock> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TopUsersViewModel>(context);
    return const SizedBox();
  }
}
