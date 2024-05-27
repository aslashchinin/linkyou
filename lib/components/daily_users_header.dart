import 'package:flutter/material.dart';

class DailyUsersHeader extends StatelessWidget {
  final List<dynamic> cities;
  final int? selectedCityId;
  final ValueChanged<int?> onCityChanged;
  final VoidCallback onPromoteMe;

  DailyUsersHeader({
    required this.cities,
    required this.selectedCityId,
    required this.onCityChanged,
    required this.onPromoteMe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Люди дня',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: onPromoteMe,
                icon: Icon(Icons.star),
                label: Text('Попасть сюда'),
              ),
              const SizedBox(width: 10),
              DropdownButton<int>(
                items: cities.map<DropdownMenuItem<int>>((city) {
                  return DropdownMenuItem<int>(
                    value: city['id'],
                    child: Text(city['title']),
                  );
                }).toList(),
                onChanged: onCityChanged,
                hint: Text('В городе'),
                value: selectedCityId,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
