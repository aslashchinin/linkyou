import 'dart:convert';
import 'package:linkyou/core/base/api_base.dart';
import 'package:linkyou/core/responses/service_response.dart';

class DialogService extends ApiBase {
  DialogService({required super.authProvider});

  Future<ServiceResponse<List<Map<String, dynamic>>>> getDialogsList(
      int limit, int page) async {
    try {
      final response = await get('/dialogs?limit=$limit&page=$page');

      return ServiceResponse(
        data: List<Map<String, dynamic>>.from(response.data),
        headers: response.headers.map,
      );
    } catch (e, stackTrace) {
      print('Error fetching dialogs: $e');
      print('Stack trace: $stackTrace');
      throw Exception('Error fetching dialogs: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> markDialogAsRead(
      BigInt dialogId) async {
    try {
      String url = '/dialog/$dialogId/read';
      final response = await post(url);
      return ServiceResponse(
        data: response.data,
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error marking dialog as read: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> deleteDialog(
      BigInt dialogId) async {
    try {
      String url = '/dialog/$dialogId/delete';
      final response = await post(url);
      return ServiceResponse(
        data: response.data,
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error deleting dialog: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> getMessagesList(
      BigInt dialogId, int limit, int page) async {
    try {
      // Формирование URL запроса
      final response = await get('/dialog/$dialogId?limit=$limit&page=$page');

      return ServiceResponse(
        data: response.data,
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error fetching messages: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> getMessage(
      BigInt messageId) async {
    try {
      final response = await get('/message/$messageId');
      return ServiceResponse(
        data: response.data,
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error fetching message: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> sendMessage(
      BigInt userId, String content, List<String> pictures) async {
    final body = {
      'user_id': userId,
      'content': content,
      'pictures': pictures.join(',')
    };
    try {
      final response = await post('/message/send', body: body);
      return ServiceResponse(
        data: json.decode(response.data),
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error adding message: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> deleteMessage(
      BigInt messageId) async {
    try {
      String url = '/message/delete';
      final response = await post(url, body: {'id': messageId});
      return ServiceResponse(
        data: response.data,
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error deleting message: $e');
    }
  }
}
