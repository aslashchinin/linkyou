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

  int? cityId;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UsersDailyCitiesViewModel>(context);
    
    return DropdownButton<int>(
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
        setState(() {
          this.cityId = cityId; 
          widget.onCityChanged?.call(this.cityId ?? 0);
        });        
      },
      value: cityId,
      hint: const Text('В городе'),
    );
  }
}
