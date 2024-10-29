import 'package:flutter/material.dart';
import 'package:linkyou/core/base/users_block_viewmodel_base.dart';

class UsersNewViewModel extends BaseUsersViewModel {
  UsersNewViewModel({required super.repository});

  int _currentSliderPage = 0;
  int get currentSliderPage => _currentSliderPage;

  Future<void> loadNewUsers() async {
    await handleUsersLoading(
      loadFunction: () => repository.getNewUsers(),
    );
  }

  Future<void> loadMoreUsers() async {
    await handleUsersLoading(
      loadFunction: () => repository.getNewUsers(
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
