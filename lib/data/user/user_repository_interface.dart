import 'package:linkyou/core/models/user.dart';

abstract class UserRepositoryInterface {
  Future<List<User>> getTopUsers();
}
