import 'dart:convert';
import 'package:linkyou/core/base/api_base.dart';
import 'package:linkyou/core/responses/service_response.dart';
import 'package:linkyou/core/enums/gender_enum.dart';

class UserService extends ApiBase {
  UserService({super.bearerToken});

  Future<ServiceResponse<List<Map<String, dynamic>>>> getTopUsers(
      {Gender? gender, int page = 0}) async {
    try {
      String url = '/users/top?type=${gender?.name}&page=$page';

      final response = await get(url);

      print(url);
      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(json.decode(response.body)),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error fetching top users: $e');
    }
  }
}
