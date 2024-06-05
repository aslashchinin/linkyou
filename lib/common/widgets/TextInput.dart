import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final TextEditingController controller;

  const TextInput(
      {super.key,
      required this.hint,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
