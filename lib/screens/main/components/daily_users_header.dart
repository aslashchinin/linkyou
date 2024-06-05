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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: ElevatedButton.icon(
                onPressed: onPromoteMe,
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide.none,
                  ),
                  backgroundColor: const Color(0xFFecf4ff),
                ),
                icon: Image.asset('assets/crown/crown.png'),
                label: const Text(
                  'Попасть сюда',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SizedBox(
                  child: DropdownButton<int>(
                    items: cities.map<DropdownMenuItem<int>>((city) {
                      return DropdownMenuItem<int>(
                        value: city['id'],
                        child: SizedBox(
                          width: 135,
                          child: Text(
                            city['title'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: onCityChanged,
                    hint: const Text('В городе'),
                    value: selectedCityId,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
