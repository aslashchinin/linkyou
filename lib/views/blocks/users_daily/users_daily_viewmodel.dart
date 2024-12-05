import 'package:linkyou/core/base/users_block_viewmodel_base.dart';
import 'package:flutter/material.dart';

class UsersDailyViewModel extends BaseUsersViewModel {
  UsersDailyViewModel({required super.repository});

  int _cityId = 0;
  int _currentSliderPage = 0;
  int get currentSliderPage => _currentSliderPage;

  void setCity(int cityId) {
    _cityId = cityId;
    loadDailyUsers();
  }

  Future<void> loadDailyUsers() async {
    await handleUsersLoading(
      loadFunction: () => repository.getDailyUsers(cityId: _cityId),
    );
  }

  Future<void> loadMoreUsers() async {
    await handleUsersLoading(
      loadFunction: () => repository.getDailyUsers(
        page: currentListPage + 1,
        cityId: _cityId,
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
