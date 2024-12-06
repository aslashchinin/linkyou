import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'users_top_viewmodel.dart';
import 'package:linkyou/views/widgets/tiles/user_short_tile.dart';
import 'package:linkyou/core/enums/gender_enum.dart';
import 'package:linkyou/views/widgets/headers/block_header.dart';
import 'package:linkyou/core/base/block_base.dart';
import 'package:linkyou/core/models/user_short.dart';
import 'package:linkyou/core/base/state_base.dart';

class UsersTopSliderBlock extends BaseBlock<UsersTopSliderBlock> {
  final Gender gender;

  const UsersTopSliderBlock({super.key, this.gender = Gender.female});

  @override
  UsersTopSliderBlockState createState() => UsersTopSliderBlockState();
}

class UsersTopSliderBlockState
    extends BaseBlockState<UsersTopSliderBlock, UsersTopViewModel, UserShort> {
  late PageController _pageController;

  @override
  void initializeData() {
    Provider.of<UsersTopViewModel>(context, listen: false)
        .loadTopUsers(gender: widget.gender);
  }

  @override
  void onRefreshPressed() {
    viewModel.loadTopUsers(gender: widget.gender);
  }

  @override
  BaseState<UserShort> getState() => viewModel.state;

  @override
  Widget buildLoadedState(BaseState<UserShort> state) {
    _pageController = PageController(initialPage: viewModel.currentSliderPage);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            children: [
              const BlockHeader(title: 'Лучшие 100'),
              const Spacer(),
              ElevatedButton(
                onPressed: () => viewModel.onPreviousPage(_pageController),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: const CircleBorder(side: BorderSide.none),
                  padding:
                      const EdgeInsets.all(4), // Устанавливаем размер кнопки
                  backgroundColor:
                      const Color(0xFFecf4ff), // Синий цвет фона кнопки
                ),
                child: const Icon(
                  Icons.arrow_left,
                  color: Colors.blue, // Цвет иконки
                ),
              ),
              ElevatedButton(
                onPressed: () => viewModel.onNextPage(_pageController),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: const CircleBorder(side: BorderSide.none),
                  padding:
                      const EdgeInsets.all(4), // Устанавливаем размер кнопки
                  backgroundColor:
                      const Color(0xFFecf4ff), // Синий цвет фона кнопки
                ),
                child: const Icon(
                  Icons.arrow_right,
                  color: Colors.blue, // Цвет иконки
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 320,
          child: PageView.builder(
            controller: _pageController,
            itemCount: (state.items.length / 3).ceil(),
            itemBuilder: (context, pageIndex) {
              final startIndex = pageIndex * 3;
              final endIndex = (startIndex + 3).clamp(0, state.items.length);
              final users = state.items.sublist(startIndex, endIndex);
              return Column(
                children: users
                    .map((user) => UserShortTile(
                          user: user,
                        ))
                    .toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
