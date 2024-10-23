import 'package:flutter/material.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/data/user/user_state.dart';

class TopUsersViewModel extends ChangeNotifier {
  TopUsersViewModel({required UserRepositoryInterface repository})
      : _repository = repository;

  UserState _state = UserState();
  final UserRepositoryInterface _repository;

  UserState get state => _state;

  Future<void> loadTopUsers() async {
    try {
      _state = _state.copyWith(status: UserStatus.loading);
      notifyListeners();

      final users = await _repository.getTopUsers();

      _state = _state.copyWith(status: UserStatus.loaded, users: users);
    } catch (e) {
      _state =
          _state.copyWith(status: UserStatus.error, errorMessage: e.toString());
    } finally {
      notifyListeners();
    }
  }
}
