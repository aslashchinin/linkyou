import 'package:flutter/material.dart';
import 'package:linkyou/core/base/block_viewmodel_base.dart';
import 'package:linkyou/core/models/user_short.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'users_new_block.dart';

class UsersNewViewModel
    extends BaseViewModel<UsersNewBlock, UserShort, UserRepositoryInterface> {
  UsersNewViewModel({required super.repository});

  int _currentSliderPage = 0;
  int get currentSliderPage => _currentSliderPage;

  Future<void> loadNewUsers() async {
    await handleItemsLoading(
      loadFunction: () => repository.getNewUsers(),
    );
  }

  Future<void> loadMoreUsers() async {
    await handleItemsLoading(
      loadFunction: () => repository.getNewUsers(
        page: currentListPage + 1,
      ),
      isLoadMore: true,
    );
  }

  void onNextPage(PageController controller) {
    if (_currentSliderPage < (state.items.length / 3).ceil() - 1) {
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
