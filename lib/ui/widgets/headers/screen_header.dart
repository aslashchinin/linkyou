import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft, // Выровнять с помощью Align
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10.0, left: 10.0), // Добавить отступы
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
