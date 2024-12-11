import 'package:linkyou/data/dialog/dialog_repository_interface.dart';
import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/data/dialog/dialog_service.dart';
import 'package:linkyou/models/dialog.dart';
import 'package:linkyou/models/message.dart';
import 'package:linkyou/models/result.dart';
import 'package:linkyou/models/pagination_info.dart';
import 'package:linkyou/models/dialog_messages.dart';

class DialogRepository implements DialogRepositoryInterface {
  final DialogService _dialogService;

  DialogRepository({required DialogService dialogService})
      : _dialogService = dialogService;

  @override
  Future<RepositoryResponse<List<Dialog>>> getDialogsList(
      {int limit = 24, int page = 1}) async {
    try {
      final serviceResponse = await _dialogService.getDialogsList(limit, page);
      final dialogs =
          serviceResponse.data.map((json) => Dialog.fromJson(json)).toList();
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: dialogs, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<void>> markDialogAsRead(BigInt dialogId) async {
    try {
      await _dialogService.markDialogAsRead(dialogId);
      return RepositoryResponse(data: null, pagination: PaginationInfo());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<void>> deleteDialog(BigInt dialogId) async {
    try {
      await _dialogService.deleteDialog(dialogId);
      return RepositoryResponse(data: null, pagination: PaginationInfo());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<DialogMessages>> getMessagesList(BigInt dialogId,
      {int limit = 24, int page = 1}) async {
    try {
      final serviceResponse =
          await _dialogService.getMessagesList(dialogId, limit, page);
      final dialogMessages = DialogMessages.fromJson(serviceResponse.data);
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);
      return RepositoryResponse(data: dialogMessages, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<Message>> getMessage(int messageId) async {
    try {
      final serviceResponse = await _dialogService.getMessage(messageId);
      return RepositoryResponse(
          data: Message.fromJson(serviceResponse.data),
          pagination: PaginationInfo());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<Result>> addMessage(
      BigInt userId, String content, List<String> pictures) async {
    try {
      final serviceResponse =
          await _dialogService.addMessage(userId, content, pictures);
      return RepositoryResponse(
          data: Result.fromJson(serviceResponse.data),
          pagination: PaginationInfo());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<Result>> deleteMessage(int id) async {
    try {
      final serviceResponse = await _dialogService.deleteMessage(id);
      return RepositoryResponse(
          data: Result.fromJson(serviceResponse.data),
          pagination: PaginationInfo());
    } catch (e) {
      rethrow;
    }
  }
}
