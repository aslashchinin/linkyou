import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/ui/blocks/layout_appbar/layout_appbar_block.dart';

class DialogMessageScreen extends ScreenBase {
  const DialogMessageScreen({super.key, required this.dialogId});

  final BigInt dialogId;

  @override
  DialogMessageScreenState createState() => DialogMessageScreenState();
}

class DialogMessageScreenState extends ScreenBaseState<DialogMessageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildContent(BuildContext context) {
    return const Center(
      child: Text('Dialog messages'),
    );
  }

  @override
  bool get showDrawer => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const LayoutAppBarBlock(
      showStarIcon: false,
    );
  }
}
