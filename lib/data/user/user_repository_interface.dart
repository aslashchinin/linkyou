import 'package:linkyou/core/models/user_short.dart';
import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/core/enums/gender_enum.dart';

abstract class UserRepositoryInterface {
  Future<RepositoryResponse<List<UserShort>>> getTopUsers({Gender? gender});
}
