import 'package:linkyou/data/dialog/dialog_repository_interface.dart';
import 'package:linkyou/core/base/block_viewmodel_base.dart';
import 'package:linkyou/models/message.dart';
import 'package:linkyou/core/responses/repository_response.dart';

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

  Future<void> sendMessage(BigInt dialogId, String message) async {
    await handleItemsLoading(
        loadFunction: () => repository.addMessage(dialogId, message, []),
        isLoadMore: true,
        isReverse: true);
  }
}
