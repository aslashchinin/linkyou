import 'package:linkyou/data/user/user_service.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/core/models/user_short.dart';
import 'package:linkyou/core/models/pagination_info.dart';
import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/core/enums/gender_enum.dart';
import 'package:linkyou/core/models/city_highlighted.dart';
import 'package:linkyou/core/models/login.dart';

class UserRepository implements UserRepositoryInterface {
  final UserService _userService;

  UserRepository({required UserService userService})
      : _userService = userService;

  @override
  Future<RepositoryResponse<List<UserShort>>> getTopUsers(
      {Gender? gender, int page = 0}) async {
    try {
      final serviceResponse =
          await _userService.getTopUsers(gender: gender, page: page);
      final users =
          serviceResponse.data.map((json) => UserShort.fromJson(json)).toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: users, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<List<UserShort>>> getDailyUsers({
    int cityId = 0,
    int page = 0,
  }) async {
    try {
      final serviceResponse =
          await _userService.getDailyUsers(cityId: cityId, page: page);
      final users =
          serviceResponse.data.map((json) => UserShort.fromJson(json)).toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: users, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<List<CityHighlighted>>> getDailyUsersCities({
    String query = '',
  }) async {
    try {
      final serviceResponse =
          await _userService.getDailyUsersCities(query: query);
      final cities = serviceResponse.data
          .map((json) => CityHighlighted.fromJson(json))
          .toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: cities, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<List<UserShort>>> getNewUsers({
    int page = 0,
  }) async {
    try {
      final serviceResponse = await _userService.getNewUsers(page: page);
      final users =
          serviceResponse.data.map((json) => UserShort.fromJson(json)).toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: users, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<Login>> login(
      String email, String password) async {
    try {
      final serviceResponse = await _userService.login(email, password);
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      final login = Login.fromJson(serviceResponse.data);

      return RepositoryResponse(
      data: login,
        pagination: pagination,
      );
    } catch (e) {
      rethrow;
    }
  }
}
