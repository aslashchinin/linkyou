import 'package:flutter/material.dart';
import 'package:linkyou/core/enums/gender_enum.dart';
import 'package:linkyou/core/base/users_block_viewmodel_base.dart';

class TopUsersViewModel extends BaseUsersViewModel {
  TopUsersViewModel({required super.repository});

  int _currentSliderPage = 0;
  int get currentSliderPage => _currentSliderPage;

  Future<void> loadTopUsers({Gender? gender}) async {
    await handleUsersLoading(
      loadFunction: () => repository.getTopUsers(gender: gender),
    );
  }

  Future<void> loadMoreUsers({Gender? gender}) async {
    await handleUsersLoading(
      loadFunction: () => repository.getTopUsers(
        gender: gender,
        page: currentListPage + 1,
      ),
      isLoadMore: true,
    );
  }

  void onNextPage(PageController controller) {
    if (_currentSliderPage < (state.users.length / 3).ceil() - 1) {
      _currentSliderPage++;
      controller.animateToPage(
        _currentSliderPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void onPreviousPage(PageController controller) {
    if (_currentSliderPage > 0) {
      _currentSliderPage--;
      controller.animateToPage(
        _currentSliderPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }
}
