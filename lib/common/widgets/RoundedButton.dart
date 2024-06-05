import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RoundedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1E88E5), // Цвет кнопки
        foregroundColor: Colors.white, // Цвет текста
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Закругленные углы
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 40, vertical: 10), // Внутренние отступы
      ),
      child: Text(text, style: const TextStyle(fontSize: 16)), // Текст кнопки
    );
  }
}
