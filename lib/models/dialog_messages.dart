import 'package:linkyou/models/dialog.dart';
import 'package:linkyou/models/message.dart';
import 'package:linkyou/core/base/model_interface_base.dart';

class DialogMessages implements ModelInterfaceBase {
  final Dialog dialog;
  final List<Message> messages;

  DialogMessages({
    required this.dialog,
    required this.messages,
  });

  factory DialogMessages.fromJson(Map<String, dynamic> json) {
    return DialogMessages(
      dialog: Dialog.fromJson(json['dialog']),
      messages: (json['messages'] as List)
          .map((messageJson) => Message.fromJson(messageJson))
          .toList(),
    );
  }
}