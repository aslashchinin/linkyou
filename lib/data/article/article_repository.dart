import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/data/article/article_repository_interface.dart';
import 'package:linkyou/data/article/article_service.dart';
import 'package:linkyou/models/article.dart';
import 'package:linkyou/models/comment.dart';
import 'package:linkyou/models/pagination_info.dart';

class ArticleRepository implements ArticleRepositoryInterface {
  final ArticleService _articleService;

  ArticleRepository({required ArticleService articleService})
      : _articleService = articleService;

  @override
  Future<RepositoryResponse<Article>> getArticle(String articleId) async {
    try {
      final serviceResponse = await _articleService.getArticle(articleId);
      final article = Article.fromJson(serviceResponse.data);
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: article, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<List<Article>>> getArticlesList() async {
    try {
      final serviceResponse = await _articleService.getArticlesList();
      final articles =
          serviceResponse.data.map((json) => Article.fromJson(json)).toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: articles, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<List<Comment>>> getArticleComments(
      String articleId) async {
    try {
      final serviceResponse =
          await _articleService.getArticleComments(articleId);
      final comments =
          serviceResponse.data.map((json) => Comment.fromJson(json)).toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: comments, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }
}
