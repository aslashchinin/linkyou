import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/core/models/photo.dart';
import 'package:linkyou/views/blocks/layout_appbar/layout_appbar_block.dart';

class PhotoCommentScreen extends ScreenBase {
  const PhotoCommentScreen({super.key, required this.photo});

  final Photo photo;

  @override
  PhotoCommentScreenState createState() => PhotoCommentScreenState();
}

class PhotoCommentScreenState extends ScreenBaseState<PhotoCommentScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildContent(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Column(children: [
      Expanded(
        child: ListView.builder(
          itemCount: 25,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 1, top: 1),
              color: Colors.white,
              elevation: 0,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 1),
                leading: Padding(
                  padding: EdgeInsets.only(top: 1.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'url_к_изображению'), // Замените на вашу ссылку
                  ),
                ),
                title: Text(
                  'Эдуард',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10), // Отступы внутри контейнера
                  decoration: BoxDecoration(
                    color: Color(0xFFf6f8fb), // Серый фон
                    borderRadius: BorderRadius.circular(30), // Круглые углы
                  ),
                  child: Text(
                    'Платье супер, очень женственно',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                trailing: Text('12:00'),
              ),
            );
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Напишите комментарий...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  bool get showDrawer => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const LayoutAppBarBlock(
      showStarIcon: false,
    );
  }
}
