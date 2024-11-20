import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/core/models/ublog_post.dart';
import 'package:linkyou/core/models/ublog_comment.dart';
import 'package:linkyou/core/models/ublog_input.dart';

abstract class UblogRepositoryInterface {
  Future<RepositoryResponse<List<UblogPost>>> getUblogsList(String userId);
  Future<RepositoryResponse<List<UblogPost>>> getUblogsAll();
  Future<RepositoryResponse<List<UblogPost>>> getUblogsPopular();
  Future<RepositoryResponse<UblogPost>> addUblog(UblogInput input);
  Future<RepositoryResponse<void>> deleteUblog(String ublogId);
  Future<RepositoryResponse<UblogPost>> editUblog(String ublogId, String text);
  Future<RepositoryResponse<UblogPost>> getUblog(String ublogId);
  Future<RepositoryResponse<void>> pinUblog(String ublogId);
  Future<RepositoryResponse<void>> unpinUblog(String ublogId);
  Future<RepositoryResponse<List<UblogComment>>> getUblogComments(
      String ublogId);
  Future<RepositoryResponse<void>> addComment(String ublogId, String comment);
}
