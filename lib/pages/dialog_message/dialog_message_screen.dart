import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/ui/blocks/layout_appbar/layout_appbar_block.dart';
import 'package:linkyou/ui/blocks/dialog_messages/dialog_messages_block.dart';

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
    return DialogMessagesBlock(dialogId: widget.dialogId);
  }

  @override
  bool get showDrawer => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return LayoutAppBarBlock(
      showStarIcon: false,
      showSearchIcon: false,
      customActions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text('Добавить в избранное'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.gif_outlined),
                    title: const Text('Сделать подарок'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.block),
                    title: const Text('Добавить в черный список'),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.report_problem_outlined,
                        color: Colors.red),
                    title: const Text('Пожаловаться',
                        style: TextStyle(color: Colors.red)),
                    onTap: () {},
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
