import 'package:flutter/material.dart';
import 'package:linkyou/common/services/api_services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:linkyou/common/widgets/RoundedButton.dart';

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
    final apiService = ApiService();
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
              child: Stack(
                children: [
                  CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                    imageUrl:
                        'https:${userDetails!['avatar']['src']['origin']}',
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${userDetails!['name']}, ${userDetails!['birthday']['age']}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${userDetails!['job']['profession']}, ${userDetails!['job']['occupation']}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                  onPressed: () {
                    // Message action
                  },
                  text: 'Сообщение',
                ),
                OutlinedButton(
                  onPressed: () {
                    // Like action
                  },
                  child: Row(
                    children: [
                      Icon(
                          userDetails!['likes']['is_liked']
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: userDetails!['likes']['is_liked']
                              ? Colors.red
                              : Colors.blue),
                      const SizedBox(width: 5),
                      const Text('Лайкнуть'),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                              style: TextStyle(fontSize: 14)),
                          Text(
                              'Понравилась ${userDetails!['rating']['likes']} из ${userDetails!['rating']['views']}',
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
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
