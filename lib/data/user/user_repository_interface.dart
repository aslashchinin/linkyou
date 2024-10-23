import 'package:linkyou/core/models/user_short.dart';

abstract class UserRepositoryInterface {
  Future<List<UserShort>> getTopUsers();
}
