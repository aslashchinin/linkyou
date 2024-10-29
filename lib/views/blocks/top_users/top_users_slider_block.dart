import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'top_users_viewmodel.dart';
import 'package:linkyou/data/user/user_state.dart';
import 'package:linkyou/views/widgets/tiles/user_short_tile.dart';
import 'package:linkyou/core/enums/gender_enum.dart';
import 'package:linkyou/views/widgets/headers/block_header.dart';
import 'package:linkyou/core/base/users_block_base.dart';

class TopUsersSliderBlock extends BaseUsersBlock {
  final Gender gender;

  const TopUsersSliderBlock({super.key, this.gender = Gender.female});

  @override
  TopUsersSliderBlockState createState() => TopUsersSliderBlockState();
}

class TopUsersSliderBlockState
    extends BaseUsersBlockState<TopUsersSliderBlock, TopUsersViewModel> {
  late PageController _pageController;

  @override
  void initializeData() {
    Provider.of<TopUsersViewModel>(context, listen: false)
        .loadTopUsers(gender: widget.gender);
  }

  @override
  void onRefreshPressed() {
    viewModel.loadTopUsers(gender: widget.gender);
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
              const BlockHeader(title: 'Лучшие 100'),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => viewModel.onPreviousPage(_pageController),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () => viewModel.onNextPage(_pageController),
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
