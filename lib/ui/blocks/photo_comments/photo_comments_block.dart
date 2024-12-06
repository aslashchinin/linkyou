import 'package:flutter/material.dart';
import 'package:linkyou/models/photo.dart';
import 'package:linkyou/core/base/block_base.dart';
import 'package:linkyou/core/base/state_base.dart';
import 'package:linkyou/models/comment.dart';
import 'package:linkyou/ui/widgets/tiles/comment_tile.dart';
import 'photo_comments_viewmodel.dart';

class PhotoCommentsBlock extends BlockBase<PhotoCommentsBlock> {
  const PhotoCommentsBlock({super.key, required this.photo});

  final Photo photo;

  @override
  PhotoCommentsBlockState createState() => PhotoCommentsBlockState();
}

class PhotoCommentsBlockState extends BlockBaseState<PhotoCommentsBlock,
    PhotoCommentsViewModel, Comment> {
  @override
  void initializeData() {
    viewModel.loadPhotoComments(widget.photo.id);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onRefreshPressed() {
    viewModel.loadPhotoComments(widget.photo.id);
  }

  @override
  StateBase<Comment> getState() => viewModel.state;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget buildLoadedState(StateBase<Comment> state) {
    return ListView.builder(
      controller: _scrollController,
      reverse: true,
      itemCount: state.items.length,
      itemBuilder: (context, index) => CommentTile(comment: state.items[index]),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
