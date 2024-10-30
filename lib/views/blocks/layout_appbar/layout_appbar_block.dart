import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'layout_appbar_viewmodel.dart';

class LayoutAppBarBlock extends StatelessWidget implements PreferredSizeWidget {
  final bool showSearchIcon;
  final bool showStarIcon;
  final List<Widget>? customActions;

  const LayoutAppBarBlock({
    super.key,
    this.showSearchIcon = true,
    this.showStarIcon = true,
    this.customActions,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LayoutAppBarViewModel>(context);
    return AppBar(
      backgroundColor: Colors.white,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          color: const Color(0xFFe9e9f5),
          height: 1.0,
        ),
      ),
      title: Center(
        child: SizedBox(
          width: 100,
          child: GestureDetector(
            onTap: () => viewModel.home(context),
            child: Image.asset('assets/logo-blue/logo.png'),
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        if (showSearchIcon)
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => viewModel.search(context),
          ),
        if (showStarIcon)
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () => viewModel.top(context),
          ),
        ...?customActions,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
