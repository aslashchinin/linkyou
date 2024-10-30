import 'package:flutter/material.dart';

class RoundText extends StatelessWidget {
  const RoundText({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8), // Внутренние отступы
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white, // Цвет фона
        border: Border.all(color: Colors.grey, width: 1), // Граница
        borderRadius: BorderRadius.circular(20), // Округлые углы
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }
}
