import 'package:linkyou/core/base/repository_interface_base.dart';
import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/models/dialog.dart';
import 'package:linkyou/models/message.dart';
import 'package:linkyou/models/result.dart';

abstract class DialogRepositoryInterface implements RepositoryInterfaceBase {
  Future<RepositoryResponse<List<Dialog>>> getDialogsList(
      {int limit = 24, int page = 1});
  Future<RepositoryResponse<void>> markDialogAsRead(BigInt dialogId);
  Future<RepositoryResponse<void>> deleteDialog(BigInt dialogId);
  Future<RepositoryResponse<List<Message>>> getMessagesList(BigInt dialogId);
  Future<RepositoryResponse<Message>> getMessage(int messageId);
  Future<RepositoryResponse<Result>> addMessage(
      BigInt userId, String content, List<String> pictures);
  Future<RepositoryResponse<void>> deleteMessage(int id);
}
