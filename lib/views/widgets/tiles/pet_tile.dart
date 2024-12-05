import 'package:flutter/material.dart';
import 'package:linkyou/core/models/pet.dart';

class PetTile extends StatelessWidget {
  const PetTile({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: pet.avatar.isNotEmpty
                ? Image.network(pet.avatar)
                : const Image(
                    image: AssetImage('assets/no_pet_avatar.png'),
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pet.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                pet.type,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
