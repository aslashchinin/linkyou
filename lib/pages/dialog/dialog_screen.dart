import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/ui/blocks/dialog/dialog_block.dart';

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
    return DialogBlock();
  }
}
