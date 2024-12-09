import 'package:flutter/material.dart';
import 'package:linkyou/models/dialog.dart' as dialogLibrary;

class DialogTile extends StatelessWidget {
  const DialogTile({required this.dialog, super.key});

  final dialogLibrary.Dialog dialog;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.only(top: 1.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(dialog.fromUser.avatar.src.origin),
          ),
        ),
        title: Text(dialog.fromUser.name),
        subtitle: Text(dialog.lastMessage.comment),
      ),
    );
  }
}
