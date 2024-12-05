import 'package:linkyou/core/base/api_base.dart';
import 'package:linkyou/core/responses/service_response.dart';

class ArticleService extends ApiBase {
  ArticleService({required super.authProvider});

  Future<ServiceResponse<Map<String, dynamic>>> getArticle(
      String articleId) async {
    try {
      final response = await get('/article/$articleId');
      return ServiceResponse(
        data: Map<String, dynamic>.from(response.data),
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error fetching article: $e');
    }
  }

  Future<ServiceResponse<List<Map<String, dynamic>>>> getArticlesList() async {
    try {
      final response = await get('/articles/');
      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(response.data),
        headers: response.headers.map,
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
        data: List<Map<String, dynamic>>.from(response.data),
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error fetching article comments: $e');
    }
  }
}
