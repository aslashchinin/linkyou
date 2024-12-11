import 'package:flutter/material.dart';
import 'package:linkyou/ui/blocks/dialog_messages/dialog_messages_block.dart';
import 'package:linkyou/ui/blocks/dialog_messages/dialog_messages_viewmodel.dart';
import 'package:linkyou/ui/blocks/dialog_messages_form/dialog_messages_form_block.dart';
import 'package:provider/provider.dart';

class DialogMessagesContainer extends StatelessWidget {
  const DialogMessagesContainer(
      {super.key, required this.dialogId, required this.userId});

  final BigInt dialogId;
  final BigInt userId;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DialogMessagesViewModel>(context);
    return Column(children: [
      Expanded(
        child: DialogMessagesBlock(dialogId: dialogId),
      ),
      const Divider(
        height: 1,
        color: Color(0xFFE0E0E0),
      ),
      DialogMessagesFormBlock(onSendPressed: (message) {
        viewModel.sendMessage(dialogId, message);
      }),
      const SizedBox(height: 20),
    ]);
  }
}
