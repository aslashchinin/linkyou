import 'package:linkyou/core/models/user_short.dart';
import 'package:linkyou/core/responses/repository_response.dart';

abstract class UserRepositoryInterface {
  Future<RepositoryResponse<List<UserShort>>> getTopUsers();
}
