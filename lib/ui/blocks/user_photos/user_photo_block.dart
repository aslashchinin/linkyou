import 'package:flutter/material.dart';
import 'package:linkyou/models/user.dart';
import 'package:linkyou/models/photo.dart';
import 'package:linkyou/core/base/block_base.dart';
import 'package:linkyou/core/base/state_base.dart';
import 'package:linkyou/core/helpers/build_helper.dart';
import 'package:linkyou/core/helpers/pluralizer_helper.dart';
import 'user_photo_viewmodel.dart';

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
  StateBase<Photo> getState() => viewModel.state;

  @override
  Widget buildLoadedState(StateBase<Photo> state) {
    final double width = (MediaQuery.of(context).size.width / 3) - 11;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.photo_camera, color: Colors.grey[700]),
              const SizedBox(width: 8),
              Text(
                PluralizerHelper.getCount(
                    widget.user.photosCount, 'фото', 'фото', 'фото'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: state.items
                .asMap()
                .entries
                .take(3)
                .map((entry) => GestureDetector(
                    onTap: () => viewModel.navigateToPhoto(context, entry.key),
                    child: entry.key > 1
                        ? BuildHelper.buildLastImageWithOverlay(
                            entry.value.src.small, width,
                            remaining: state.items.length - 3)
                        : BuildHelper.buildImage(entry.value.src.small, width)))
                .toList(),
          ),
        ],
      ),
    );
  }
}
