import 'package:linkyou/models/user_short.dart';
import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/core/enums/gender_enum.dart';
import 'package:linkyou/models/city_highlighted.dart';
import 'package:linkyou/models/user.dart';
import 'package:linkyou/models/user_gift.dart';
import 'package:linkyou/models/gifts.dart';
import 'package:linkyou/core/base/repository_interface_base.dart';

abstract class UserRepositoryInterface implements RepositoryInterfaceBase {
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

  Future<RepositoryResponse<User>> getUser(BigInt id);

  Future<RepositoryResponse<User>> getCurrentUser();

  Future<RepositoryResponse<List<UserGift>>> getUserGifts(BigInt id);

  Future<RepositoryResponse<List<Gifts>>> getGiftsList();
}
