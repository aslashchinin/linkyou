import 'dart:convert';
import 'package:linkyou/core/base/api_base.dart';
import 'package:linkyou/core/responses/service_response.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:linkyou/core/models/ublog_input.dart';

class UblogService extends ApiBase {
  UblogService({required AuthProvider authProvider})
      : super(authProvider: authProvider);

  Future<ServiceResponse<List<Map<String, dynamic>>>> getUblogsList(
      String userId) async {
    try {
      String url = '/ublogs/$userId';
      final response = await get(url);
      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(json.decode(response.body)),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error fetching ublogs list: $e');
    }
  }

  Future<ServiceResponse<List<Map<String, dynamic>>>> getUblogsAll() async {
    try {
      String url = '/ublogs/all';
      final response = await get(url);
      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(json.decode(response.body)),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error fetching all ublogs: $e');
    }
  }

  Future<ServiceResponse<List<Map<String, dynamic>>>> getUblogsPopular() async {
    try {
      String url = '/ublogs/popular';
      final response = await get(url);
      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(json.decode(response.body)),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error fetching popular ublogs: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> addUblog(
      UblogInput input) async {
    try {
      String url = '/ublogs/add';
      final response = await post(url, body: input.toJson());
      return ServiceResponse(
        data: json.decode(response.body),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error adding ublog: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> deleteUblog(
      String ublogId) async {
    try {
      String url = '/ublog/$ublogId/delete';
      final response = await post(url);
      return ServiceResponse(
        data: json.decode(response.body),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error deleting ublog: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> editUblog(
      String ublogId, String text) async {
    try {
      String url = '/ublog/$ublogId/edit';
      final response = await post(url, body: {'text': text});
      return ServiceResponse(
        data: json.decode(response.body),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error editing ublog: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> getUblog(String ublogId) async {
    try {
      String url = '/ublog/$ublogId';
      final response = await get(url);
      return ServiceResponse(
        data: json.decode(response.body),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error fetching ublog: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> pinUblog(String ublogId) async {
    try {
      String url = '/ublog/$ublogId/pin';
      final response = await post(url);

      return ServiceResponse(
        data: json.decode(response.body),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error pinning ublog: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> unpinUblog(
      String ublogId) async {
    try {
      String url = '/ublog/$ublogId/unpin';
      final response = await post(url);
      return ServiceResponse(
        data: json.decode(response.body),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error unpinning ublog: $e');
    }
  }

  Future<ServiceResponse<List<Map<String, dynamic>>>> getUblogComments(
      String ublogId) async {
    try {
      String url = '/ublog/$ublogId/comments';
      final response = await get(url);
      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(json.decode(response.body)),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error fetching ublog comments: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> addComment(
      String ublogId, String comment) async {
    try {
      String url = '/ublog/$ublogId/comment/add';
      final response = await post(url, body: {'comment': comment});
      return ServiceResponse(
        data: json.decode(response.body),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error adding comment to ublog: $e');
    }
  }
}
