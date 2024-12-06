import 'package:flutter/material.dart';
import 'package:linkyou/models/user.dart';
import 'package:linkyou/models/photo.dart';
import 'user_photo_viewmodel.dart';
import 'package:linkyou/core/base/block_base.dart';
import 'package:linkyou/core/base/state_base.dart';
import 'package:linkyou/ui/widgets/tiles/user_photo_tile.dart';

class UserPhotoBlock extends BlockBase<UserPhotoBlock> {
  const UserPhotoBlock({super.key, required this.user});

  final User user;

  @override
  UserPhotoBlockState createState() => UserPhotoBlockState();
}

class UserPhotoBlockState
    extends BlockBaseState<UserPhotoBlock, UserPhotoViewModel, Photo> {
  
  @override
  void initializeData() {
    viewModel.clearState();
    viewModel.loadUserPhotos(widget.user.id);
  }

  @override
  void onRefreshPressed() {
    viewModel.loadUserPhotos(widget.user.id);
  }

  @override
  BaseState<Photo> getState() => viewModel.state;

  @override
  Widget buildLoadedState(BaseState<Photo> state) {
    return ListView.builder(
      itemCount: state.items.length,
      itemBuilder: (context, index) {
        return UserPhotoTile(
          photo: state.items[index],
        );
      },
    );
  }
}
