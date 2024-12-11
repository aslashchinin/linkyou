import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/ui/blocks/dialog/dialog_block.dart';
import 'package:linkyou/ui/widgets/headers/screen_header.dart';

class DialogScreen extends ScreenBase {
  const DialogScreen({super.key});

  @override
  DialogScreenState createState() => DialogScreenState();
}

class DialogScreenState extends ScreenBaseState<DialogScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildContent(BuildContext context) {
    return const Column(children: [
      ScreenHeader(title: 'Мои сообщения'),
      SizedBox(height: 10),
      Divider(
        height: 1,
        color: Color(0xFFE0E0E0),
      ),
      Expanded(
        child: DialogBlock(),
      )
    ]);
  }
}
