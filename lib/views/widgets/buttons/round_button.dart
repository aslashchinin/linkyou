import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final bool isGreen;
  final bool isBlue;

  const RoundButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.isGreen = false,
    this.isBlue = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isOutlined
            ? OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16, color: Colors.white),
                  side: const BorderSide(color: Colors.white),
                ),
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              )
            : ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isGreen
                      ? Colors.green
                      : isBlue
                          ? Colors.blue
                          : Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16, color: Colors.white),
                  elevation: 0, // Убираем тени
                ),
                child: Text(text),
              ),
      ),
    );
  }
}
