import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final bool isGreen;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.isGreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double
          .infinity, // Устанавливаем ширину контейнера для заполнения родительского элемента
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isOutlined
            ? OutlinedButton(
                onPressed: onPressed,
                child: Text(text),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18, color: Colors.white),
                  side: BorderSide(color: Colors.white),
                ),
              )
            : ElevatedButton(
                onPressed: onPressed,
                child: Text(text),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isGreen ? Colors.green : Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                  elevation: 0, // Убираем тени
                ),
              ),
      ),
    );
  }
}
