import 'package:linkyou/data/ublog/ublog_repository_interface.dart';
import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/core/models/ublog_post.dart';
import 'package:linkyou/core/models/ublog_comment.dart';
import 'package:linkyou/data/ublog/ublog_service.dart';
import 'package:linkyou/core/models/pagination_info.dart';
import 'package:linkyou/core/models/ublog_input.dart';

class UblogRepository implements UblogRepositoryInterface {
  final UblogService _ublogService;

  UblogRepository({required UblogService ublogService})
      : _ublogService = ublogService;

  @override
  Future<RepositoryResponse<List<UblogPost>>> getUblogsList(
      String userId) async {
    try {
      final serviceResponse = await _ublogService.getUblogsList(userId);
      final ublogs =
          serviceResponse.data.map((json) => UblogPost.fromJson(json)).toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: ublogs, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<List<UblogPost>>> getUblogsAll() async {
    try {
      final serviceResponse = await _ublogService.getUblogsAll();
      final ublogs =
          serviceResponse.data.map((json) => UblogPost.fromJson(json)).toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: ublogs, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<List<UblogPost>>> getUblogsPopular() async {
    try {
      final serviceResponse = await _ublogService.getUblogsPopular();
      final ublogs =
          serviceResponse.data.map((json) => UblogPost.fromJson(json)).toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: ublogs, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<UblogPost>> addUblog(UblogInput input) async {
    try {
      final serviceResponse = await _ublogService.addUblog(input);
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(
          data: UblogPost.fromJson(serviceResponse.data),
          pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<void>> deleteUblog(String ublogId) async {
    try {
      final serviceResponse = await _ublogService.deleteUblog(ublogId);
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: null, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<UblogPost>> editUblog(
      String ublogId, String text) async {
    try {
      final serviceResponse = await _ublogService.editUblog(ublogId, text);
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(
          data: UblogPost.fromJson(serviceResponse.data),
          pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<UblogPost>> getUblog(String ublogId) async {
    try {
      final serviceResponse = await _ublogService.getUblog(ublogId);
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(
          data: UblogPost.fromJson(serviceResponse.data),
          pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<void>> pinUblog(String ublogId) async {
    try {
      final serviceResponse = await _ublogService.pinUblog(ublogId);
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: null, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<void>> unpinUblog(String ublogId) async {
    try {
      final serviceResponse = await _ublogService.unpinUblog(ublogId);
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: null, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<List<UblogComment>>> getUblogComments(
      String ublogId) async {
    try {
      final serviceResponse = await _ublogService.getUblogComments(ublogId);
      final comments = serviceResponse.data
          .map((json) => UblogComment.fromJson(json))
          .toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: comments, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<void>> addComment(
      String ublogId, String comment) async {
    try {
      final serviceResponse = await _ublogService.addComment(ublogId, comment);
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: null, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }
}
