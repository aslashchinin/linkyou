import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/core/models/article.dart';
import 'package:linkyou/core/models/comment.dart';

abstract class ArticleRepositoryInterface {
  Future<RepositoryResponse<Article>> getArticle(String articleId);
  Future<RepositoryResponse<List<Article>>> getArticlesList();
  Future<RepositoryResponse<List<Comment>>> getArticleComments(
      String articleId);
}
