import 'package:linkyou/data/user/user_service.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/core/models/user.dart';

class UserRepository implements UserRepositoryInterface {
  final UserService _userService;

  UserRepository({required UserService userService})
      : _userService = userService;

  @override
  Future<List<User>> getTopUsers() async {
    try {
      final response = await _userService.getTopUsers();
      return response.map((json) => User.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
