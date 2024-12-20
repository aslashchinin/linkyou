import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/models/photo.dart';
import 'package:linkyou/models/photo_input.dart';
import 'package:linkyou/models/photo_edit_input.dart';
import 'package:linkyou/models/photo_comment_input.dart';
import 'package:linkyou/models/comment.dart';
import 'package:linkyou/models/like.dart';
import 'package:linkyou/models/result.dart';
import 'package:linkyou/core/base/repository_interface_base.dart';

abstract class PhotoRepositoryInterface implements RepositoryInterfaceBase {
  Future<RepositoryResponse<List<Photo>>> getPhotosList(BigInt userId);
  Future<RepositoryResponse<Photo>> addPhoto(PhotoInput input);
  Future<RepositoryResponse<Photo>> getPhoto(int photoId);
  Future<RepositoryResponse<void>> editPhoto(int photoId, PhotoEditInput input);
  Future<RepositoryResponse<Result>> deletePhoto(int photoId);
  Future<RepositoryResponse<void>> recoveryPhoto(int photoId);
  Future<RepositoryResponse<List<Comment>>> getPhotoComments(int photoId);
  Future<RepositoryResponse<List<Comment>>> addPhotoComment(
      int photoId, PhotoCommentInput input);
  Future<RepositoryResponse<Result>> deletePhotoComment(
      int photoId, int commentId);
  Future<RepositoryResponse<List<String>>> getLikes(int photoId);
  Future<RepositoryResponse<Like>> likePhoto(int photoId);
}
