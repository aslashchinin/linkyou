import 'package:flutter/material.dart';
import '../widgets/user_card.dart';

class NewUsersSlider extends StatefulWidget {
  final List<dynamic> users;

  NewUsersSlider({required this.users});

  @override
  _NewUsersSliderState createState() => _NewUsersSliderState();
}

class _NewUsersSliderState extends State<NewUsersSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < (widget.users.length / 3).ceil() - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Text(
                'Новые анкеты',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: _previousPage,
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: _nextPage,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 350,
          child: PageView.builder(
            controller: _pageController,
            itemCount: (widget.users.length / 3).ceil(),
            itemBuilder: (context, pageIndex) {
              final startIndex = pageIndex * 3;
              final endIndex = (startIndex + 3).clamp(0, widget.users.length);
              final pageUsers = widget.users.sublist(startIndex, endIndex);

              return Column(
                children: pageUsers.map((user) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UserCard(
                      avatarUrl: 'https:${user['avatar']['src']['square']}',
                      name: user['name'],
                      age: user['birthday']['age'],
                      profession: user['job']['profession'],
                      occupation: user['job']['occupation'],
                      photosCount: user['photos_count'],
                      city: user['location']['city_name'],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/user',
                          arguments: user['id'],
                        );
                      },
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}