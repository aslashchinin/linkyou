import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/core/models/photo.dart';
import 'package:linkyou/core/models/photo_input.dart';
import 'package:linkyou/core/models/photo_edit_input.dart';
import 'package:linkyou/core/models/photo_comment_input.dart';
import 'package:linkyou/core/models/comment.dart';
import 'package:linkyou/data/photo/photo_service.dart';
import 'package:linkyou/data/photo/photo_repository_interface.dart';
import 'package:linkyou/core/models/pagination_info.dart';
import 'package:linkyou/core/models/like.dart';
import 'package:linkyou/core/models/result.dart';
import 'package:linkyou/core/models/photo_comment_add_result.dart';

class PhotoRepository implements PhotoRepositoryInterface {
  final PhotoService _photoService;

  PhotoRepository({required PhotoService photoService})
      : _photoService = photoService;

  @override
  Future<RepositoryResponse<List<Photo>>> getPhotosList(BigInt userId) async {
    try {
      final serviceResponse = await _photoService.getPhotosList(userId);
      final photos =
          serviceResponse.data.map((json) => Photo.fromJson(json)).toList();
      return RepositoryResponse(data: photos);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<Photo>> addPhoto(PhotoInput input) async {
    try {
      final serviceResponse = await _photoService.addPhoto(input);
      return RepositoryResponse(data: Photo.fromJson(serviceResponse.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<Photo>> getPhoto(int photoId) async {
    try {
      final serviceResponse = await _photoService.getPhoto(photoId);
      return RepositoryResponse(data: Photo.fromJson(serviceResponse.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<void>> editPhoto(
      int photoId, PhotoEditInput input) async {
    try {
      await _photoService.editPhoto(photoId, input);
      return RepositoryResponse(data: null);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<Result>> deletePhoto(int photoId) async {
    try {
      final serviceResponse = await _photoService.deletePhoto(photoId);
      return RepositoryResponse(data: Result.fromJson(serviceResponse.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<void>> recoveryPhoto(int photoId) async {
    try {
      await _photoService.recoveryPhoto(photoId);
      return RepositoryResponse(data: null);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<List<Comment>>> getPhotoComments(
      int photoId) async {
    try {
      final serviceResponse = await _photoService.getPhotoComments(photoId);
      final comments =
          serviceResponse.data.map((json) => Comment.fromJson(json)).toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: comments, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<PhotoCommentAddResult>> addPhotoComment(
      int photoId, PhotoCommentInput input) async {
    try {
      final serviceResponse =
          await _photoService.addPhotoComment(photoId, input);
      return RepositoryResponse(
          data: PhotoCommentAddResult.fromJson(serviceResponse.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<Result>> deletePhotoComment(
      int photoId, int commentId) async {
    try {
      final serviceResponse =
          await _photoService.deletePhotoComment(photoId, commentId);
      return RepositoryResponse(data: Result.fromJson(serviceResponse.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<List<String>>> getLikes(int photoId) async {
    try {
      final serviceResponse = await _photoService.getLikes(photoId);
      return RepositoryResponse(data: List<String>.from(serviceResponse.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<Like>> likePhoto(int photoId) async {
    try {
      final serviceResponse = await _photoService.likePhoto(photoId);
      return RepositoryResponse(data: Like.fromJson(serviceResponse.data));
    } catch (e) {
      rethrow;
    }
  }
}