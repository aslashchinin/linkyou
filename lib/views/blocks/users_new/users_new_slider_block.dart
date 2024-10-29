import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/data/user/user_state.dart';
import 'package:linkyou/views/widgets/tiles/user_short_tile.dart';
import 'package:linkyou/views/widgets/headers/block_header.dart';
import 'package:linkyou/core/base/users_block_base.dart';
import 'package:linkyou/views/blocks/users_new/users_new_viewmodel.dart';

class UsersNewSliderBlock extends BaseUsersBlock {
  

  const UsersNewSliderBlock({super.key});

  @override
  UsersTopSliderBlockState createState() => UsersTopSliderBlockState();
}

class UsersTopSliderBlockState
    extends BaseUsersBlockState<UsersNewSliderBlock, UsersNewViewModel> {
  late PageController _pageController;

  @override
  void initializeData() {
    Provider.of<UsersNewViewModel>(context, listen: false)
        .loadNewUsers();
  }

  @override
  void onRefreshPressed() {
    viewModel.loadNewUsers();
  }

  @override
  UserState getState() => viewModel.state;

  @override
  Widget buildLoadedState(UserState state) {
    _pageController = PageController(initialPage: viewModel.currentSliderPage);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            children: [
              const BlockHeader(title: 'Новые анкеты'),
              const Spacer(),
              ElevatedButton(
                onPressed: () => viewModel.onPreviousPage(_pageController),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: const CircleBorder(side: BorderSide.none), 
                  padding: const EdgeInsets.all(4), // Устанавливаем размер кнопки
                  backgroundColor: const Color(0xFFecf4ff), // Синий цвет фона кнопки                
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
                  padding: const EdgeInsets.all(4), // Устанавливаем размер кнопки
                  backgroundColor: const Color(0xFFecf4ff), // Синий цвет фона кнопки                
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
          height: 350,
          child: PageView.builder(
            controller: _pageController,
            itemCount: (state.users.length / 3).ceil(),
            itemBuilder: (context, pageIndex) {
              final startIndex = pageIndex * 3;
              final endIndex = (startIndex + 3).clamp(0, state.users.length);
              final users = state.users.sublist(startIndex, endIndex);
              return Column(
                children: users
                    .map((user) => UserShortTile(
                          user: user,
                          onTap: () => viewModel.onUserTap(user),
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