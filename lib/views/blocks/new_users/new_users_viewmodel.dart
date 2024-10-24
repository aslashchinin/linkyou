import 'package:flutter/material.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/data/user/user_state.dart';
import 'package:linkyou/core/models/user_short.dart';
import 'package:linkyou/core/enums/user_status_enum.dart';

class NewUsersViewModel extends ChangeNotifier {
  NewUsersViewModel({required UserRepositoryInterface repository})
      : _repository = repository;

  final UserRepositoryInterface _repository;

  UserState _state = UserState();
  UserState get state => _state;

  int _currentListPage = 0;
  int get currentListPage => _currentListPage;

  Future<void> loadNewUsers() async {
    try {
      _state = _state.copyWith(status: UserStatus.loading);
      notifyListeners();

      final repositoryResponse = await _repository.getNewUsers();
      _currentListPage = repositoryResponse.pagination.currentPage;
      _state = _state.copyWith(
          status: UserStatus.loaded, users: repositoryResponse.data);
      if (repositoryResponse.pagination.isEnd) {
        _state = _state.copyWith(status: UserStatus.end);
      }
    } catch (e, stackTrace) {
      _state = _state.copyWith(
          status: UserStatus.error, errorMessage: stackTrace.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> loadMoreUsers() async {
    try {
      _state = _state.copyWith(status: UserStatus.loadingMore);
      notifyListeners();

      final repositoryResponse = await _repository.getNewUsers(
        page: _currentListPage + 1,
      );
      _currentListPage = repositoryResponse.pagination.currentPage;
      _state = _state.copyWith(
        status: UserStatus.loaded,
        users: [..._state.users, ...repositoryResponse.data],
      );
      if (repositoryResponse.pagination.isEnd) {
        _state = _state.copyWith(status: UserStatus.end);
      }
    } catch (e, stackTrace) {
      _state = _state.copyWith(
          status: UserStatus.error, errorMessage: stackTrace.toString());
    } finally {
      notifyListeners();
    }
  }

  void onUserTap(UserShort user) {
    print('User tapped: ${user.name}');
  }
}
