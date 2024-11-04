import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user.dart';
import 'package:linkyou/views/widgets/tiles/pet_tile.dart';

class UserPets extends StatelessWidget {
  final User user;

  const UserPets({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.pets, color: Colors.grey[700]),
              const SizedBox(width: 8),
              const Text(
                'Питомцы',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: user.pets!.map((pet) => PetTile(pet: pet)).toList(),
          )
        ],
      ),
    );
  }
}
