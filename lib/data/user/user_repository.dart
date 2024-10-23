import 'package:linkyou/data/user/user_service.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/core/models/user_short.dart';
import 'package:linkyou/core/models/pagination_info.dart';
import 'package:linkyou/core/responses/repository_response.dart';

class UserRepository implements UserRepositoryInterface {
  final UserService _userService;

  UserRepository({required UserService userService})
      : _userService = userService;

  @override
  Future<RepositoryResponse<List<UserShort>>> getTopUsers() async {
    try {
      final serviceResponse = await _userService.getTopUsers();
      final users =
          serviceResponse.data.map((json) => UserShort.fromJson(json)).toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: users, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }
}
