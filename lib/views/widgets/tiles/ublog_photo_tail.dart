import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:linkyou/core/models/ublog_photo.dart';

class UblogPhotoTail extends StatelessWidget {
  const UblogPhotoTail({super.key, required this.photo});

  final UblogPhoto photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Переход к экрану полного размера изображения
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullScreenImage(imageUrl: photo.src),
          ),
        );
      },
      child: ClipRect(
        child: Image.network(
          photo.src,
          fit: BoxFit.fitWidth, // Соответствие ширине экрана
          width: double.infinity, // Максимальная ширина
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  FullScreenImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Полное изображение')),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
