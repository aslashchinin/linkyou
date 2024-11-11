import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:swipe_cards/swipe_cards.dart';

class LikeYouScreen extends ScreenBase {
  const LikeYouScreen({super.key});
  @override
  LikeYouScreenState createState() => LikeYouScreenState();
}

class LikeYouScreenState extends ScreenBaseState<LikeYouScreen> {
  late List<SwipeItem> _swipeItems;
  late MatchEngine _matchEngine;

  final List<Map<String, String>> _data = [
    {
      "imageUrl":
          "https://img.linkyou.ru/3355807520/c8e2f682c210782c0891bdf50821b9be/origin.jpg",
      "title": "Card 1"
    },
    {
      "imageUrl":
          "https://img.linkyou.ru/1032137184/8e536c1a6e6740a6f26e78cda05f2115/origin.jpg",
      "title": "Card 2"
    },
    {
      "imageUrl":
          "https://img.linkyou.ru/3355807520/c8e2f682c210782c0891bdf50821b9be/origin.jpg",
      "title": "Card 3"
    },
  ];

  @override
  void initState() {
    super.initState();
    _swipeItems = _data.map((data) {
      return SwipeItem(
        content: data,
        likeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Liked ${data['title']}"),
          ));
        },
        nopeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Disliked ${data['title']}"),
          ));
        },
        superlikeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Superliked ${data['title']}"),
          ));
        },
      );
    }).toList();

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget buildContent(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Center(
      child: SwipeCards(
        matchEngine: _matchEngine,
        itemBuilder: (context, index) {
          final item = _swipeItems[index].content as Map<String, String>;
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: screenSize.width, // 90% ширины экрана
              height: screenSize.height * 0.6, // 60% высоты экрана
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    item["imageUrl"]!,
                    height: screenSize.height * 0.4, // 40% высоты экрана
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text(
                    item["title"]!,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
        onStackFinished: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("No more cards"),
          ));
        },
        itemChanged: (SwipeItem item, int index) {
          print("Item changed: ${item.content['title']}");
        },
        upSwipeAllowed: false,
        fillSpace: true, // Позволяет заполнить доступное пространство
      ),
    );
  }
}
