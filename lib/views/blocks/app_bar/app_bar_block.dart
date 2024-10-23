import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_bar_viewmodel.dart';

class AppBarBlock extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AppBarBlockViewModel>(context);
    return AppBar(
      backgroundColor: Colors.white,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          color: const Color(0xFFe9e9f5),
          height: 2.0,
        ),
      ),
      title: Center(
        child: SizedBox(
          width: 100,
          child: Image.asset('assets/logo-blue/logo.png'),
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => viewModel.search(context),
        ),
        IconButton(
          icon: const Icon(Icons.star),
          onPressed: () => viewModel.top(context),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}