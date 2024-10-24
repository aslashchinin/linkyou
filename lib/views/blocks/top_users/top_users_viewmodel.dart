import 'package:flutter/material.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/data/user/user_state.dart';
import 'package:linkyou/core/models/user_short.dart';
import 'package:linkyou/core/enums/gender_enum.dart';

class TopUsersViewModel extends ChangeNotifier {
  TopUsersViewModel({required UserRepositoryInterface repository})
      : _repository = repository;

  UserState _state = UserState();
  UserState get state => _state;

  int _currentSliderPage = 0;
  int get currentSliderPage => _currentSliderPage;

  int _currentListPage = 0;
  int get currentListPage => _currentListPage;

  final UserRepositoryInterface _repository;

  Future<void> loadTopUsers({Gender? gender}) async {
    try {
      _state = _state.copyWith(status: UserStatus.loading);
      final repositoryResponse = await _repository.getTopUsers(gender: gender);
      _currentListPage = repositoryResponse.pagination.currentPage;
      _state = _state.copyWith(
          status: UserStatus.loaded, users: repositoryResponse.data);
    } catch (e, stackTrace) {
      _state = _state.copyWith(
          status: UserStatus.error, errorMessage: stackTrace.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> loadMoreUsers({Gender? gender}) async {
    try {
      final repositoryResponse = await _repository.getTopUsers(
        gender: gender,
        page: _currentListPage + 1,
      );
      _currentListPage = repositoryResponse.pagination.currentPage;
      _state = _state.copyWith(
        users: [..._state.users, ...repositoryResponse.data],
      );
    } catch (e, stackTrace) {
      _state = _state.copyWith(
          status: UserStatus.error, errorMessage: stackTrace.toString());
    } finally {
      notifyListeners();
    }
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

  void clearState() {
    _state = UserState();
    notifyListeners();
  }

  void onUserTap(UserShort user) {
    print(user.name);
  }
}
