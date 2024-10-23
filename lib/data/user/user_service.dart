import 'dart:convert';
import 'package:linkyou/core/base/api_base.dart';

class UserService extends ApiBase {
  UserService({super.bearerToken});

  Future<List<Map<String, dynamic>>> getTopUsers() async {
    try {
      final response = await get('/users/top');
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } catch (e) {
      throw Exception('Error fetching top users: $e');
    }
  }
}
