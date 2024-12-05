import 'package:linkyou/core/base/api_base.dart';
import 'package:linkyou/core/responses/service_response.dart';
import 'package:linkyou/core/models/photo_input.dart';
import 'package:linkyou/core/models/photo_edit_input.dart';
import 'package:linkyou/core/models/photo_comment_input.dart';

class PhotoService extends ApiBase {
  PhotoService({required super.authProvider});

  Future<ServiceResponse<List<Map<String, dynamic>>>> getPhotosList(
      BigInt userId) async {
    try {
      String url = '/photos/$userId/';
      final response = await get(url);
      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(response.data),
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error fetching photos list: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> addPhoto(
      PhotoInput input) async {
    try {
      String url = '/photos/add';
      final response = await post(url, body: input.toJson());
      return ServiceResponse(
        data: response.data,
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error adding photo: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> getPhoto(int photoId) async {
    try {
      String url = '/photo/$photoId';
      final response = await get(url);
      return ServiceResponse(
        data: response.data,
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error fetching photo: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> editPhoto(
      int photoId, PhotoEditInput input) async {
    try {
      String url = '/photo/$photoId/edit';
      final response = await post(url, body: input.toJson());
      return ServiceResponse(
        data: response.data,
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error editing photo: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> deletePhoto(int photoId) async {
    try {
      String url = '/photo/$photoId/delete';
      final response = await post(url);
      return ServiceResponse(
        data: response.data,
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error deleting photo: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> recoveryPhoto(
      int photoId) async {
    try {
      String url = '/photo/$photoId/recovery';
      final response = await post(url);
      return ServiceResponse(
        data: response.data,
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error recovering photo: $e');
    }
  }

  Future<ServiceResponse<List<Map<String, dynamic>>>> getPhotoComments(
      int photoId) async {
    try {
      String url = '/photo/$photoId/comments';
      final response = await get(url);
      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(response.data),
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error fetching photo comments: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> addPhotoComment(
      int photoId, PhotoCommentInput input) async {
    try {
      String url = '/photo/$photoId/comment/add';
      final response = await post(url, body: input.toJson());
      return ServiceResponse(
        data: response.data,
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error adding comment to photo: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> deletePhotoComment(
      int photoId, int commentId) async {
    try {
      String url = '/photo/$photoId/comment/$commentId/delete';
      final response = await post(url);
      return ServiceResponse(
        data: response.data,
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error deleting photo comment: $e');
    }
  }

  Future<ServiceResponse<List<String>>> getLikes(int photoId) async {
    try {
      String url = '/photo/$photoId/likes';
      final response = await get(url);
      return ServiceResponse(
        data: List<String>.from(response.data),
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error fetching likes for photo: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> likePhoto(int photoId) async {
    try {
      String url = '/photo/$photoId/like';
      final response = await post(url);
      return ServiceResponse(
        data: response.data,
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error liking photo: $e');
    }
  }
}
