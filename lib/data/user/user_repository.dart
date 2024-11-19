import 'package:linkyou/data/user/user_service.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/core/models/user_short.dart';
import 'package:linkyou/core/models/pagination_info.dart';
import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/core/enums/gender_enum.dart';
import 'package:linkyou/core/models/city_highlighted.dart';
import 'package:linkyou/core/models/login.dart';
import 'package:linkyou/core/models/user.dart';
import 'package:linkyou/core/models/photo.dart';
import 'package:linkyou/core/models/user_gift.dart';
import 'package:linkyou/core/models/gifts.dart';

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
  Future<RepositoryResponse<Login>> login(String email, String password) async {
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

  @override
  Future<RepositoryResponse<User>> getUser(BigInt id) async {
    try {
      final serviceResponse = await _userService.getUser(id);
      final user = User.fromJson(serviceResponse.data);
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);

      return RepositoryResponse(data: user, pagination: pagination);
    } catch (e, stackTrace) {
      print(stackTrace.toString());
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<User>> getCurrentUser() async {
    try {
      final serviceResponse = await _userService.getCurrentUser();
      final user = User.fromJson(serviceResponse.data);
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: user, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<List<Photo>>> getUserPhotos(BigInt id) async {
    try {
      final serviceResponse = await _userService.getUserPhotos(id);
      final photos = serviceResponse.data
          .map((json) => Photo.fromJson(json))
          .toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: photos, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<List<UserGift>>> getUserGifts(BigInt id) async {
    try {
      final serviceResponse = await _userService.getUserGifts(id);
      final gifts = serviceResponse.data
          .map((json) => UserGift.fromJson(json))
          .toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: gifts, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<List<Gifts>>> getGiftsList() async {
    try {
      final serviceResponse = await _userService.getGiftsList();
      final gifts = serviceResponse.data
          .map((json) => Gifts.fromJson(json))
          .toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: gifts, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }
}
