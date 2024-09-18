import 'package:flutter/material.dart';
import 'package:linkyou/common/providers/api_provider.dart';
import 'package:provider/provider.dart';
import 'components/top_users_list.dart';

class TopUsersScreen extends StatefulWidget {
  @override
  _TopUsersScreenState createState() => _TopUsersScreenState();
}

class _TopUsersScreenState extends State<TopUsersScreen> {
  List<dynamic> topUsers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchTopUsers();
  }

  Future<void> _fetchTopUsers() async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    try {
      final fetchedUsers = await apiProvider.getTopUsers();
      setState(() {
        topUsers = fetchedUsers;
      });
    } catch (e) {
      print(e); // Обработка ошибок
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Лучшие 10')),
        backgroundColor: Colors.white,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Лучшие 10')),
      backgroundColor: Colors.white,
      body: TopUsersList(users: topUsers),
    );
  }
}
