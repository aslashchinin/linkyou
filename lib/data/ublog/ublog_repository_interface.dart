import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/core/models/ublog_post.dart';
import 'package:linkyou/core/models/ublog_comment.dart';
import 'package:linkyou/core/models/ublog_input.dart';

abstract class UblogRepositoryInterface {
  Future<RepositoryResponse<List<UblogPost>>> getUblogsList(
      BigInt userId, int? limit);
  Future<RepositoryResponse<List<UblogPost>>> getUblogsAll();
  Future<RepositoryResponse<List<UblogPost>>> getUblogsPopular();
  Future<RepositoryResponse<UblogPost>> addUblog(UblogInput input);
  Future<RepositoryResponse<void>> deleteUblog(BigInt ublogId);
  Future<RepositoryResponse<UblogPost>> editUblog(BigInt ublogId, String text);
  Future<RepositoryResponse<UblogPost>> getUblog(BigInt ublogId);
  Future<RepositoryResponse<void>> pinUblog(BigInt ublogId);
  Future<RepositoryResponse<void>> unpinUblog(BigInt ublogId);
  Future<RepositoryResponse<List<UblogComment>>> getUblogComments(
      BigInt ublogId);
  Future<RepositoryResponse<void>> addComment(BigInt ublogId, String comment);
}
