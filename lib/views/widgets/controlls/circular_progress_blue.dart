import 'package:flutter/material.dart';

class CircularProgressBlue extends StatelessWidget {
  const CircularProgressBlue({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 300),
      child: const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
          color: Colors.white,
        ),
      ),
    );
  }
}
