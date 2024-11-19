import 'package:flutter/material.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/data/user/user_state.dart';
import 'package:linkyou/core/models/user_short.dart';
import 'package:linkyou/core/enums/user_status_enum.dart';

abstract class BaseUsersViewModel extends ChangeNotifier {
  BaseUsersViewModel({required UserRepositoryInterface repository})
      : _repository = repository;

  @protected
  final UserRepositoryInterface _repository;
  UserRepositoryInterface get repository => _repository;

  UserState _state = UserState();
  UserState get state => _state;

  int _currentListPage = 0;
  int get currentListPage => _currentListPage;
  set currentListPage(int value) {
    _currentListPage = value;
    notifyListeners();
  }

  @protected
  void setState(UserState newState) {
    _state = newState;
    notifyListeners();
  }

  @protected
  void setCurrentPage(int page) {
    _currentListPage = page;
  }

  @protected
  Future<void> handleUsersLoading({
    required Future<dynamic> Function() loadFunction,
    bool isLoadMore = false,
  }) async {
    try {
      setState(_state.copyWith(
        status: isLoadMore ? UserStatus.loadingMore : UserStatus.loading,
      ));

      final repositoryResponse = await loadFunction();
      setCurrentPage(repositoryResponse.pagination.currentPage);

      final updatedUsers = isLoadMore
          ? [..._state.users, ...repositoryResponse.data]
          : [...repositoryResponse.data];

      setState(_state.copyWith(
        status: repositoryResponse.pagination.isEnd
            ? UserStatus.end
            : UserStatus.loaded,
        users: updatedUsers.cast<UserShort>(),
      ));
    } catch (e, stackTrace) {
      setState(_state.copyWith(
        status: UserStatus.error,
        errorMessage: stackTrace.toString(),
      ));
    }
  }

  void clearState() {
    setState(UserState());
  }
}
