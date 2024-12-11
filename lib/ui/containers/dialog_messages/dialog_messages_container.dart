import 'package:flutter/material.dart';
import 'package:linkyou/ui/blocks/dialog_messages/dialog_messages_block.dart';
import 'package:linkyou/ui/blocks/dialog_messages/dialog_messages_viewmodel.dart';
import 'package:linkyou/ui/blocks/dialog_messages_form/dialog_messages_form_block.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/ui/widgets/tiles/user_avatar_tile.dart';
import 'package:linkyou/models/user_short.dart';

class DialogMessagesContainer extends StatelessWidget {
  const DialogMessagesContainer(
      {super.key, required this.dialogId, required this.user});

  final BigInt dialogId;
  final UserShort user;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DialogMessagesViewModel>(context);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: UserAvatarTile(
            user: user,
            additionalText: '${user.job.profession}, ${user.job.occupation}'),
      ),
      const Divider(
        height: 1,
        color: Color(0xFFE0E0E0),
      ),
      Expanded(
        child: DialogMessagesBlock(dialogId: dialogId),
      ),
      const Divider(
        height: 1,
        color: Color(0xFFE0E0E0),
      ),
      DialogMessagesFormBlock(onSendPressed: (message) {
        viewModel.sendMessage(user.id, message);
      }),
      const SizedBox(height: 20),
    ]);
  }
}
