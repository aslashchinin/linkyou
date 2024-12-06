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
  
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildContent(BuildContext context) {      
    return Column(children: [
      Expanded(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 25,
          itemBuilder: (context, index) {
            return const SizedBox(
                height: 10); //CommentTile(comment: Comment());
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
