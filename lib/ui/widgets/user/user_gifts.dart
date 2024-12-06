import 'package:flutter/material.dart';
import 'package:linkyou/models/user.dart';
import 'package:linkyou/ui/blocks/gifts_slider/gifts_slider_block.dart';

class UserGifts extends StatelessWidget {
  const UserGifts({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.wallet_giftcard, color: Colors.grey[700]),
                const SizedBox(width: 8),
                Text(
                  user.gifts?.count == 0
                      ? 'Сделать подарок'
                      : '${user.gifts?.count} подарков',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const GiftsSliderBlock(),
          ],
        ));
  }
}
