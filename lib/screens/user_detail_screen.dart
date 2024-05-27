import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/api_service.dart';
import 'package:percent_indicator/percent_indicator.dart';

class UserDetailScreen extends StatefulWidget {
  final int userId;

  UserDetailScreen({required this.userId});

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  Map<String, dynamic>? userDetails;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    final apiService = Provider.of<ApiService>(context, listen: false);
    try {
      final fetchedUserDetails = await apiService.getUserDetails(widget.userId);
      setState(() {
        userDetails = fetchedUserDetails;
      });
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userDetails == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Детали пользователя'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Детали пользователя'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              _showMoreOptions();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                _showFullScreenImage(userDetails!['avatar']['src']['origin']);
              },
              child: Image.network(
                'https:${userDetails!['avatar']['src']['origin']}',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${userDetails!['name']}, ${userDetails!['birthday']['age']}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      '${userDetails!['job']['profession']}, ${userDetails!['job']['occupation']}'),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('${userDetails!['avatar']['likes_count']} лайков'),
                      SizedBox(width: 10),
                      Text('${userDetails!['photos_count']} фото'),
                      SizedBox(width: 10),
                      Text('${userDetails!['location']['city_name']}'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Chip(
                          label: Text(
                              '${userDetails!['birthday']['zodiac']['name']}')),
                      SizedBox(width: 10),
                      Chip(
                          label: Text(
                        '${userDetails!['nationality']?['name'] ?? 'Unknown'}',
                      )),
                    ],
                  ),
                  SizedBox(width: 10),
                  Chip(
                      label: Text(
                          'Ищу партнера от ${userDetails!['age']['from']} до ${userDetails!['age']['to']} лет')),
                  SizedBox(height: 10),
                  Chip(label: Text('Цель: ${userDetails!['goal']['name']}')),
                  SizedBox(width: 20, height: 20),
                  Row(
                    children: [
                      CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 5.0,
                        percent: userDetails!['rating']['score'] / 10.0,
                        center: Text(
                          '${userDetails!['rating']['score']}',
                          style: TextStyle(fontSize: 20),
                        ),
                        progressColor: Colors.blue,
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Рейтинг анкеты',
                              style: TextStyle(fontSize: 16)),
                          Text(
                              'Понравилась ${userDetails!['rating']['likes']} из ${userDetails!['rating']['views']}',
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Message action
                  },
                  child: Text('Сообщение'),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Like action
                  },
                  child: Text('Лайкнуть'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Добавить в избранное'),
              onTap: () {
                // Add to favorites action
              },
            ),
            ListTile(
              leading: Icon(Icons.block),
              title: Text('Добавить в черный список'),
              onTap: () {
                // Add to blacklist action
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Пожаловаться'),
              onTap: () {
                // Report action
              },
            ),
          ],
        );
      },
    );
  }

  void _showFullScreenImage(String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Image.network('https:$imageUrl'),
          ),
        ),
      ),
    );
  }
}
