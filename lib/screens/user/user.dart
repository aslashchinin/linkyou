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
  Map<String, dynamic>? userPhotos;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
    _fetchUserPhotos();
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

  Future<void> _fetchUserPhotos() async {
    final apiService = ApiService();
    try {
      final fetchedUserDetails = await apiService.getUserPhotos(widget.userId);
      setState(() {
        userPhotos = fetchedUserDetails;
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
      backgroundColor: Colors.white,
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
            _buildAvatarSection(),
            const SizedBox(height: 10),
            _buildActionButtons(),
            const SizedBox(height: 10),
            _buildInfoSection(),
            _buildDivider(),
            _buildDetailsSection(),
            _buildDivider(),
            _buildInterestsSection(),
            _buildDivider(),
            _buildEducationSection(),
          ],
        ),
      ),
    );
  }

  // Виджет с аватаром и информацией
  Widget _buildAvatarSection() {
    return GestureDetector(
      onTap: () {
        _showFullScreenImage(userDetails!['avatar']['src']['origin']);
      },
      child: Stack(
        children: [
          CachedNetworkImage(
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.0),
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
    );
  }

  // Виджет с кнопками "Сообщение" и "Лайкнуть"
  Widget _buildActionButtons() {
    return Row(
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
                    : Colors.blue,
              ),
              const SizedBox(width: 5),
              const Text('Лайкнуть'),
            ],
          ),
        ),
      ],
    );
  }

  // Виджет с информацией о лайках, фото и городе
  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 15,
          runSpacing: 10,
          children: [
            _buildIconInfo(Icons.favorite_border,
                '${userDetails!['avatar']['likes_count']} лайков'),
            _buildIconInfo(
                Icons.camera_enhance, '${userDetails!['photos_count']} фото'),
            _buildIconInfo(Icons.location_city_sharp,
                '${userDetails!['location']['city_name']}'),
          ],
        ),
      ),
    );
  }

  // Общий виджет для отображения информации с иконками
  Widget _buildIconInfo(IconData icon, String info) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 18,
        ),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            info,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    );
  }

  // Виджет для разделителя
  Widget _buildDivider() {
    return Container(
      height: 20,
      color: const Color(0xFFeeeef8),
    );
  }

  // Виджет для секции с подробностями
  Widget _buildDetailsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Обо мне'),
          Text(userDetails!['about'].toString().isNotEmpty
              ? userDetails!['about']
              : ''),
          _buildInfoRow('Рост', 'height'),
          _buildInfoRow('Состоит ли в отношениях', 'relationship', 'name'),
          _buildInfoRow('Дети', 'children', 'name'),
          _buildInfoRow('Отношение к курению', 'smoking', 'name'),
          _buildInfoRow('Отношение к алкоголю', 'alcohol', 'name'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Виджет для секции с интересами
  Widget _buildInterestsSection() {
    // Проверяем наличие ключа 'interests' и его непустое содержимое
    if (userDetails == null || !userDetails!.containsKey('interests')) {
      return SizedBox
          .shrink(); // Возвращаем пустой виджет, если ключ отсутствует
    }

    final interestsData = userDetails!['interests'];

    // Проверяем, что 'interests' — это список и он содержит непустые строки
    final List<dynamic> interestsList = interestsData['interests'] ?? [];
    final validInterests = interestsList
        .where((interest) =>
            interest != null && interest.toString().trim().isNotEmpty)
        .toList();

    // Если нет валидных интересов, не отображаем секцию
    if (validInterests.isEmpty) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Интересы'),
          Wrap(
            spacing: 8.0,
            children: List<Widget>.generate(
              validInterests.length,
              (int index) {
                return Chip(
                  backgroundColor: Colors.white,
                  label: Text(validInterests[index]),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Виджет для секции с образованием
  Widget _buildEducationSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Образование'),
          _buildInfoRow('Знание языков', 'language'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Общий виджет для информации с заголовком и ключом массива
  // Общий виджет для информации с заголовком и ключом массива
  Widget _buildInfoRow(String label, String key, [String? subKey]) {
    // Проверка наличия ключа и его значения в userDetails
    if (!userDetails!.containsKey(key)) return const SizedBox.shrink();

    // Получаем значение по ключу
    final dynamic keyValue = userDetails![key];

    // Если есть под-ключ (subKey), пытаемся получить значение для под-ключа
    final dynamic value =
        subKey != null && keyValue is Map ? keyValue[subKey] : keyValue;

    // Если значение пустое или отсутствует, не отображаем строку
    if (value == null || value.toString().isEmpty) {
      return const SizedBox
          .shrink(); // Если значение отсутствует или пустое, возвращаем пустой виджет
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(value.toString()),
          ),
        ],
      ),
    );
  }

  // Виджет для заголовков секций
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
