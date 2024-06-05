import 'package:flutter/material.dart';
import 'package:linkyou/common/providers/api_provider.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserScreen extends StatefulWidget {
  final int userId;

  UserScreen({required this.userId});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Map<String, dynamic>? userDetails;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    final apiService = Provider.of<ApiProvider>(context, listen: false);
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
          title: const Text('Детали пользователя'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали пользователя'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
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
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                imageUrl: 'https:${userDetails!['avatar']['src']['origin']}',
                height: 450,
                width: MediaQuery.of(context).size.width,
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
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      '${userDetails!['job']['profession']}, ${userDetails!['job']['occupation']}'),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text('${userDetails!['avatar']['likes_count']} лайков'),
                      const SizedBox(width: 10),
                      Text('${userDetails!['photos_count']} фото'),
                      const SizedBox(width: 10),
                      Text('${userDetails!['location']['city_name']}'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Chip(
                          label: Text(
                              '${userDetails!['birthday']['zodiac']['name']}')),
                      const SizedBox(width: 10),
                      Chip(
                          label: Text(
                        '${userDetails!['nationality']?['name'] ?? 'Unknown'}',
                      )),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Chip(
                      label: Text(
                          'Ищу партнера от ${userDetails!['age']['from']} до ${userDetails!['age']['to']} лет')),
                  const SizedBox(height: 10),
                  Chip(label: Text('Цель: ${userDetails!['goal']['name']}')),
                  const SizedBox(width: 20, height: 20),
                  Row(
                    children: [
                      CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 5.0,
                        percent: userDetails!['rating']['score'] / 10.0,
                        center: Text(
                          '${userDetails!['rating']['score']}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        progressColor: Colors.blue,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Рейтинг анкеты',
                              style: TextStyle(fontSize: 16)),
                          Text(
                              'Понравилась ${userDetails!['rating']['likes']} из ${userDetails!['rating']['views']}',
                              style: const TextStyle(fontSize: 16)),
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
                  child: const Text('Сообщение'),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Like action
                  },
                  child: const Text('Лайкнуть'),
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
              leading: const Icon(Icons.favorite),
              title: const Text('Добавить в избранное'),
              onTap: () {
                // Add to favorites action
              },
            ),
            ListTile(
              leading: const Icon(Icons.block),
              title: const Text('Добавить в черный список'),
              onTap: () {
                // Add to blacklist action
              },
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('Пожаловаться'),
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
            child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(0),
              minScale: 0.1,
              maxScale: 5.0,
              child: Image.network('https:$imageUrl'),
            ),
          ),
        ),
      ),
    );
  }
}
