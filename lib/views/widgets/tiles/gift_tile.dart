import 'package:flutter/material.dart';
import 'package:linkyou/core/models/gift.dart';

class GiftTile extends StatelessWidget {
  const GiftTile({super.key, required this.gift});

  final Gift gift;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          // Фото из интернета
          Image.network(
            gift.picture,
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
          Center(
            child: Container(
              width: 30, // Размер кнопки
              height: 30, // Размер кнопки
              decoration: const BoxDecoration(
                color: Colors.white, // Серый фон кнопки
                shape: BoxShape.circle, // Делаем её круглой
              ),
              child: IconButton(
                onPressed: () {
                  // Действие при нажатии
                  print('Кнопка с плюсиком нажата');
                },
                icon: const Icon(Icons.add), // Плюсик
                color: Colors.blue, // Синий цвет плюсика
                iconSize: 15, // Размер иконки
              ),
            ),
          ),
        ],
      ),
    );
  }
}
