import 'package:flutter/material.dart';

class ScreenTitleHeader extends StatelessWidget {
  const ScreenTitleHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft, // Выровнять с помощью Align
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
