import 'package:linkyou/core/base/block_viewmodel_base.dart';
import 'package:linkyou/models/user_short.dart';
import 'package:flutter/material.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';

class UsersDailyViewModel
    extends BlockViewModelBase<UserShort, UserRepositoryInterface> {
  UsersDailyViewModel({required super.repository});

  int _cityId = 0;
  int _currentSliderPage = 0;
  int get currentSliderPage => _currentSliderPage;

  void setCity(int cityId) {
    _cityId = cityId;
    loadDailyUsers();
  }

  Future<void> loadDailyUsers() async {
    await handleItemsLoading(
      loadFunction: () => repository.getDailyUsers(cityId: _cityId),
    );
  }

  Future<void> loadMoreUsers() async {
    await handleItemsLoading(
      loadFunction: () => repository.getDailyUsers(
        page: currentListPage + 1,
        cityId: _cityId,
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
