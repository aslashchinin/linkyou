import 'package:flutter/material.dart';

class PhotoCommentsFormBlock extends StatefulWidget {
  const PhotoCommentsFormBlock({super.key});

  @override
  State<PhotoCommentsFormBlock> createState() => _PhotoCommentsFormBlockState();
}

class _PhotoCommentsFormBlockState extends State<PhotoCommentsFormBlock> {
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
                  hintText: 'Напишите комментарий...',
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
                Icons.comment,
                color: Colors.white,
              ),
              onPressed: () {
                // Обработка нажатия кнопки отправки
              },
            ),
          ),
        ],
      ),
    );
  }
}
