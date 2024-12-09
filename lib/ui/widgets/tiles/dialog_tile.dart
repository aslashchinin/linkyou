import 'package:flutter/material.dart';
import 'package:linkyou/models/dialog.dart' as dialogLibrary;

class DialogTile extends StatelessWidget {
  const DialogTile({required this.dialog, super.key});

  final dialogLibrary.Dialog dialog;

  @override
  Widget build(BuildContext context) {
    return Text(dialog.id.toString());
  }
}
