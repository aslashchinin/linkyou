import 'package:flutter/material.dart';
import 'package:linkyou/models/dialog.dart' as dialog_library;
import 'package:linkyou/ui/widgets/controlls/html_text.dart';
import 'package:linkyou/ui/widgets/pictures/user_avatar.dart';
import 'package:linkyou/core/helpers/pluralizer_helper.dart';

class DialogTile extends StatelessWidget {
  const DialogTile({required this.dialog, super.key});

  final dialog_library.Dialog dialog;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Column(
        children: [
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: UserAvatarWithStatus(
                userId: dialog.fromUser.id,
                avatarUrl: dialog.fromUser.avatar.src.origin,
                isOnline: dialog.fromUser.isOnline,
              ),
            ),
            title: Text(dialog.fromUser.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            subtitle: HtmlText(text: dialog.lastMessage.comment),
            trailing: Text(PluralizerHelper.formatTime(
                DateTime.parse(dialog.lastMessage.datetime).toLocal())),
          ),
          const Divider(
            height: 1,
            color: Color(0xFFE0E0E0),
          ),
        ],
      ),
    );
  }
}
