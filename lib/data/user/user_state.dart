import 'package:linkyou/core/models/user_short.dart';

enum UserStatus { initial, loading, loaded, error }

class UserState {
  final List<UserShort> users;
  final UserStatus status;
  final String? errorMessage;

  UserState({
    this.users = const [],
    this.status = UserStatus.initial,
    this.errorMessage,
  });

  UserState copyWith({
    List<UserShort>? users,
    UserStatus? status,
    String? errorMessage,
  }) {
    return UserState(
      users: users ?? this.users,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}