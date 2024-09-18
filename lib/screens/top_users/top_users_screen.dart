import 'package:flutter/material.dart';
import 'package:linkyou/common/services/api_services.dart';
import 'components/top_users_list.dart';

class TopUsersScreen extends StatefulWidget {
  @override
  _TopUsersScreenState createState() => _TopUsersScreenState();
}

class _TopUsersScreenState extends State<TopUsersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<dynamic> topUsersMale = [];
  List<dynamic> topUsersFemale = [];
  bool isLoading = true; // Индикатор загрузки пользователей
  bool isLoadingMore = false; // Индикатор загрузки при прокрутке до конца
  int pageMale = 1; // Текущая страница для Мужчин
  int pageFemale = 1; // Текущая страница для Женщин

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchTopUsers('male'); // Загружаем Мужчин
    _fetchTopUsers('female'); // Загружаем Женщин
  }

  Future<void> _fetchTopUsers(String type) async {
    final apiProvider = new ApiService();
    try {
      final fetchedUsers = await apiProvider.getTopUsers(
          type: type, page: (type == 'male') ? pageMale : pageFemale);
      setState(() {
        if (type == 'male') {
          topUsersMale.addAll(fetchedUsers);
        } else {
          topUsersFemale.addAll(fetchedUsers);
        }
      });
    } catch (e) {
      print(e); // Обработка ошибок
    } finally {
      setState(() {
        isLoading = false; // Остановка общего индикатора загрузки
        isLoadingMore = false; // Остановка индикатора загрузки при прокрутке
      });
    }
  }

  void _loadMore(String type) {
    if (isLoadingMore) return; // Если уже идет загрузка, ничего не делаем

    setState(() {
      isLoadingMore = true; // Начинаем загрузку при достижении конца списка
    });

    if (type == 'male') {
      pageMale++;
      _fetchTopUsers('male');
    } else {
      pageFemale++;
      _fetchTopUsers('female');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Лучшие 100'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Мужчины'),
            Tab(text: 'Женщины'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              // Проверяем, достигли ли мы конца списка
              if (!isLoadingMore &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                _loadMore('male');
              }
              return true;
            },
            child: Column(
              children: [
                Expanded(
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : TopUsersList(users: topUsersMale),
                ),
                if (isLoadingMore) // Показываем прелоадер, если загружаем больше
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              // Проверяем, достигли ли мы конца списка
              if (!isLoadingMore &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                _loadMore('female');
              }
              return true;
            },
            child: Column(
              children: [
                Expanded(
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : TopUsersList(users: topUsersFemale),
                ),
                if (isLoadingMore) // Показываем прелоадер, если загружаем больше
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
