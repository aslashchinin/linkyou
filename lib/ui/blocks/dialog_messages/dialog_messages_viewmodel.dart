import 'package:linkyou/data/dialog/dialog_repository_interface.dart';
import 'package:linkyou/core/base/block_viewmodel_base.dart';
import 'package:linkyou/models/message.dart';
import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/core/providers/socket_provider.dart';
import 'package:linkyou/core/services/locator_service.dart';
import 'package:linkyou/models/socket_new_message.dart';

class DialogMessagesViewModel
    extends BlockViewModelBase<Message, DialogRepositoryInterface> {
  DialogMessagesViewModel({required super.repository});

  Future<void> loadDialogMessages(BigInt dialogId) async {
    await handleItemsLoading(
      loadFunction: () async {
        final dialogMessages = await repository.getMessagesList(dialogId);
        return RepositoryResponse(
            data: dialogMessages.data.messages,
            pagination: dialogMessages.pagination);
      },
    );
  }

  void attachSocketListener(BigInt dialogId) {
    final socketProvider = serviceLocator<SocketProvider>();
    socketProvider.onNewMessageCallbacks.add((SocketNewMessage data) {
      if (data.dialogId == dialogId) {
        handleItemsLoading(
            loadFunction: () async {
              final message = await repository.getMessage(data.messageId);
              return RepositoryResponse(
                  data: [message.data], pagination: message.pagination);
            },
            isLoadMore: true,
            isReverse: true);
      }
    });
  }

  void detachSocketListener(BigInt dialogId) {
    final socketProvider = serviceLocator<SocketProvider>();
    socketProvider.unsubscribeFromNewMessage((SocketNewMessage data) {
      if (data.dialogId == dialogId) {
        handleItemsLoading(
            loadFunction: () async {
              final message = await repository.getMessage(data.messageId);
              return RepositoryResponse(
                  data: [message.data], pagination: message.pagination);
            },
            isLoadMore: true,
            isReverse: true);
      }
    });
  }

  Future<void> sendMessage(BigInt userId, String message) async {
    await handleItemsLoading(
        loadFunction: () async {
          final response = await repository.sendMessage(userId, message, []);
          return RepositoryResponse(
              data: [response.data], pagination: response.pagination);
        },
        isLoadMore: true,
        isReverse: true);
  }

  Future<void> deleteMessage(BigInt messageId) async {
    await handleItemsLoading(
        loadFunction: () => repository.deleteMessage(messageId),
        isLoadMore: true,
        isReverse: true);
  }
}
