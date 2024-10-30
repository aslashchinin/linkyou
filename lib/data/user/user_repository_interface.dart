import 'package:linkyou/core/models/user_short.dart';
import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/core/enums/gender_enum.dart';
import 'package:linkyou/core/models/city_highlighted.dart';
import 'package:linkyou/core/models/login.dart';
import 'package:linkyou/core/models/user.dart';

abstract class UserRepositoryInterface {
  Future<RepositoryResponse<List<UserShort>>> getTopUsers({
    Gender? gender,
    int page = 0,
  });

  Future<RepositoryResponse<List<UserShort>>> getDailyUsers({
    int cityId = 0,
    int page = 0,
  });

  Future<RepositoryResponse<List<CityHighlighted>>> getDailyUsersCities({
    String query = '',
  });

  Future<RepositoryResponse<List<UserShort>>> getNewUsers({
    int page = 0,
  });

  Future<RepositoryResponse<Login>> login(String email, String password);

  Future<RepositoryResponse<User>> getUser(int id);
}
