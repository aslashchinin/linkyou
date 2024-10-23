import 'dart:convert';
import 'package:linkyou/core/base/api_base.dart';
import 'package:linkyou/core/responses/service_response.dart';

class UserService extends ApiBase {
  UserService({super.bearerToken});

  Future<ServiceResponse<List<Map<String, dynamic>>>> getTopUsers() async {
    try {
      final response = await get('/users/top');
      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(json.decode(response.body)),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error fetching top users: $e');
    }
  }
}
