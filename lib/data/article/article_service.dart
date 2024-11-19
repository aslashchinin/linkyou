import 'dart:convert';
import 'package:linkyou/core/base/api_base.dart';
import 'package:linkyou/core/responses/service_response.dart';

class ArticleService extends ApiBase {
  ArticleService({super.bearerToken});

  Future<ServiceResponse<Map<String, dynamic>>> getArticle(
      String articleId) async {
    try {
      final response = await get('/article/$articleId');
      return ServiceResponse(
        data: Map<String, dynamic>.from(json.decode(response.body)),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error fetching article: $e');
    }
  }

  Future<ServiceResponse<List<Map<String, dynamic>>>> getArticlesList() async {
    try {
      final response = await get('/articles/');
      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(json.decode(response.body)),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error fetching articles list: $e');
    }
  }

  Future<ServiceResponse<List<Map<String, dynamic>>>> getArticleComments(
      String articleId) async {
    try {
      final response = await get('/article/$articleId/comments');
      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(json.decode(response.body)),
        headers: response.headers,
      );
    } catch (e) {
      throw Exception('Error fetching article comments: $e');
    }
  }
}
