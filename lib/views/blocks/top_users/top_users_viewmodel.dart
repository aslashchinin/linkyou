import 'package:flutter/material.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/data/user/user_state.dart';
import 'package:linkyou/core/models/user_short.dart';
import 'package:linkyou/core/enums/gender_enum.dart';

class TopUsersViewModel extends ChangeNotifier {
  TopUsersViewModel({required UserRepositoryInterface repository})
      : _repository = repository;

  UserState _state = UserState();
  final UserRepositoryInterface _repository;

  UserState get state => _state;

  Future<void> loadTopUsers({Gender? gender}) async {
    try {
      _state = _state.copyWith(status: UserStatus.loading);
      notifyListeners();

      final repositoryResponse = await _repository.getTopUsers(gender: gender);

      _state = _state.copyWith(
          status: UserStatus.loaded, users: repositoryResponse.data);
    } catch (e, stackTrace) {
      _state = _state.copyWith(
          status: UserStatus.error, errorMessage: stackTrace.toString());
    } finally {
      notifyListeners();
    }
  }

  void onUserTap(UserShort user) {
    print(user.name);
  }
}
