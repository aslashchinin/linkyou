import 'package:linkyou/core/base/api_base.dart';
import 'package:linkyou/core/responses/service_response.dart';
import 'package:linkyou/core/enums/gender_enum.dart';

class UserService extends ApiBase {
  UserService({required super.authProvider});


  Future<ServiceResponse<List<Map<String, dynamic>>>> getTopUsers(
      {Gender? gender, int page = 0}) async {
    try {
      String url = '/users/top?type=${gender?.name}&page=$page';

      final response = await get(url);

      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(response.data),
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error fetching top users: $e');
    }
  }

  Future<ServiceResponse<List<Map<String, dynamic>>>> getDailyUsers({
    int cityId = 0,
    int page = 0,
  }) async {
    try {
      String url = '/users/daily?city_id=$cityId&page=$page';

      final response = await get(url);

      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(response.data),
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error fetching daily users: $e');
    }
  }

  Future<ServiceResponse<List<Map<String, dynamic>>>> getDailyUsersCities({
    String query = '',
  }) async {
    try {
      String url = '/lists/cities?q=$query';

      final response = await get(url);

      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(response.data),
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error fetching daily users cities: $e');
    }
  }

  Future<ServiceResponse<List<Map<String, dynamic>>>> getNewUsers({
    int page = 0,
  }) async {
    try {
      String url = '/users/new?page=$page';

      final response = await get(url);

      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(response.data),
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error fetching new users: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> getUser(BigInt id) async {
    final response = await get('/user/$id');

    return ServiceResponse(
      data: Map<String, dynamic>.from(response.data),
      headers: response.headers.map,
    );
  }

  Future<ServiceResponse<Map<String, dynamic>>> getCurrentUser() async {
    final response = await get('/user/current');

    return ServiceResponse(
      data: Map<String, dynamic>.from(response.data),
      headers: response.headers.map,
    );
  }

  Future<ServiceResponse<List<Map<String, dynamic>>>> getUserPhotos(
      BigInt id) async {
    final response = await get('/photos/$id');

    return ServiceResponse(
      data: List<Map<String, dynamic>>.from(response.data),
      headers: response.headers.map,
    );
  }

  Future<ServiceResponse<List<Map<String, dynamic>>>> getUserGifts(
      BigInt id) async {
    final response = await get('/gifts/$id');

    return ServiceResponse(
      data: List<Map<String, dynamic>>.from(response.data),
      headers: response.headers.map,
    );
  }

  Future<ServiceResponse<List<Map<String, dynamic>>>> getGiftsList() async {
    final response = await get('/gifts');

    return ServiceResponse(
      data: List<Map<String, dynamic>>.from(response.data),
      headers: response.headers.map,
    );
  }
}
