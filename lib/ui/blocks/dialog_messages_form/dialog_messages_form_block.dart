import 'package:flutter/material.dart';

class DialogMessagesFormBlock extends StatefulWidget {
  const DialogMessagesFormBlock({super.key, required this.onSendPressed});

  final Function(String) onSendPressed;

  @override
  State<DialogMessagesFormBlock> createState() =>
      _DialogMessagesFormBlockState();
}

class _DialogMessagesFormBlockState extends State<DialogMessagesFormBlock> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F8FB),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 300.0,
              ),
              child: TextField(
                controller: _controller,
                minLines: 1,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Напишите сообщение...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
          ),
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.white,
              ),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  widget.onSendPressed(_controller.text);
                  _controller.text = '';
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
