import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'users_daily_cities_viewmodel.dart';

class UsersDailyCitiesBlock extends StatefulWidget {
  const UsersDailyCitiesBlock({super.key, this.onCityChanged});

  final ValueChanged<int>? onCityChanged;

  @override
  UsersDailyCitiesBlockState createState() => UsersDailyCitiesBlockState();
}

class UsersDailyCitiesBlockState extends State<UsersDailyCitiesBlock> {
  UsersDailyCitiesBlockState();

  @override
  void initState() {
    super.initState();
    final viewModel =
        Provider.of<UsersDailyCitiesViewModel>(context, listen: false);
    viewModel.loadDailyUsersCities();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UsersDailyCitiesViewModel>(context);

    return viewModel.cities.isEmpty
        ? const SizedBox.shrink()
        : DropdownButton<int>(
            items: viewModel.cities.map<DropdownMenuItem<int>>((city) {
              return DropdownMenuItem<int>(
                value: city.id,
                child: SizedBox(
                  width: 135,
                  child: Text(
                    city.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            }).toList(),
            onChanged: (cityId) {
              viewModel.setCity(cityId);
              widget.onCityChanged?.call(cityId ?? 0);
            },
            value: viewModel.cities
                    .map((city) => city.id)
                    .contains(viewModel.cityId)
                ? viewModel.cityId
                : null,
            hint: const Text('В городе'),
          );
  }
}
