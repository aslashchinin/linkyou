import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/api_service.dart';
import '../components/daily_users_header.dart';
import '../components/daily_users_list.dart';
import '../components/new_users_slider.dart';
import '../components/top_users_slider.dart';
import 'package:linkyou/components/drawer_menu.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> dailyUsers = [];
  List<dynamic> cities = [];
  List<dynamic> newUsers = [];
  List<dynamic> topUsers = [];
  int page = 1;
  bool isLoading = false;
  int? selectedCityId;

  @override
  void initState() {
    super.initState();
    _fetchDailyUsers();
    _fetchCities();
    _fetchNewUsers();
    _fetchTopUsers();
  }

  Future<void> _fetchDailyUsers({int? cityId, bool clear = false}) async {
    if (clear) {
      setState(() {
        dailyUsers.clear();
        page = 1;
      });
    }

    setState(() {
      isLoading = true;
    });

    final apiService = Provider.of<ApiService>(context, listen: false);
    try {
      final fetchedUsers =
          await apiService.getDailyUsers(12, page, cityId: cityId);
      setState(() {
        dailyUsers.addAll(fetchedUsers);
        page++;
      });
    } catch (e) {
      // Handle error
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchCities() async {
    final apiService = Provider.of<ApiService>(context, listen: false);
    try {
      final fetchedCities = await apiService.getCities();
      setState(() {
        cities = fetchedCities;
      });
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  Future<void> _fetchNewUsers() async {
    final apiService = Provider.of<ApiService>(context, listen: false);
    try {
      final fetchedUsers = await apiService.getNewUsers();
      setState(() {
        newUsers = fetchedUsers;
      });
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  Future<void> _fetchTopUsers() async {
    final apiService = Provider.of<ApiService>(context, listen: false);
    try {
      final fetchedUsers = await apiService.getTopUsers();
      setState(() {
        topUsers = fetchedUsers;
      });
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LINKYOU'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Open search screen
            },
          ),
        ],
      ),
      drawer: DrawerMenu(), // Подключение меню
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DailyUsersHeader(
              cities: cities,
              selectedCityId: selectedCityId,
              onCityChanged: (cityId) {
                setState(() {
                  selectedCityId = cityId;
                });
                _fetchDailyUsers(cityId: selectedCityId, clear: true);
              },
              onPromoteMe: () {
                // Action for "Попасть сюда"
              },
            ),
            DailyUsersList(
              users: dailyUsers,
              isLoading: isLoading,
              onLoadMore: () => _fetchDailyUsers(cityId: selectedCityId),
            ),
            SizedBox(height: 16),
            NewUsersSlider(
              users: newUsers,
            ),
            SizedBox(height: 16),
            TopUsersSlider(
              users: topUsers,
            ),
          ],
        ),
      ),
    );
  }
}