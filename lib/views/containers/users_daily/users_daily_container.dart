import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/views/blocks/users_daily_cities/users_daily_cities_block.dart';
import 'package:linkyou/views/blocks/users_daily/users_daily_block.dart';
import 'package:linkyou/views/widgets/headers/block_header.dart';
import 'package:linkyou/views/blocks/users_daily/users_daily_viewmodel.dart';

class UsersDailyContainer extends StatelessWidget {
  const UsersDailyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final usersViewModel = Provider.of<UsersDailyViewModel>(context);

    return Column(
      children: [
        const BlockHeader(title: 'Люди дня'),
        const SizedBox(height: 10),
        const Divider(
          height: 1,
          color: Color(0xFFe9e9f5),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                  child: ElevatedButton.icon(
                onPressed: () => {},
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
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: UsersDailyCitiesBlock(
                  onCityChanged: (cityId) => usersViewModel.loadDailyUsers(cityId: cityId),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const SizedBox(child: UsersDailyBlock()),
      ],
    );
  }
}
