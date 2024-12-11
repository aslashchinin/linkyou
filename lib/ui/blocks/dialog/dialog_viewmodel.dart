import 'package:linkyou/core/base/block_viewmodel_base.dart';
import 'package:linkyou/data/dialog/dialog_repository_interface.dart';
import 'package:linkyou/core/services/route_service.dart';
import 'package:linkyou/models/dialog.dart' as dialog_library;
import 'package:flutter/material.dart';
import 'package:linkyou/core/providers/socket_provider.dart';
import 'package:linkyou/core/services/locator_service.dart';
import 'package:linkyou/models/socket_new_message.dart';

class DialogViewModel extends BlockViewModelBase<dialog_library.Dialog,
    DialogRepositoryInterface> {
  DialogViewModel({required super.repository});

  Future<void> loadDialogs() async {
    await handleItemsLoading(
      loadFunction: () => repository.getDialogsList(),
    );
  }

  Future<void> loadMoreDialogs() async {
    await handleItemsLoading(
        loadFunction: () =>
            repository.getDialogsList(page: currentListPage + 1),
        isLoadMore: true);
  }

  void attachSocketListener() {
    final socketProvider = serviceLocator<SocketProvider>();
    socketProvider.subscribeToNewMessage((SocketNewMessage data) async {
      final item =
          state.items.firstWhere((element) => element.id == data.dialogId);
      final message = await repository.getMessage(data.messageId);
      item.lastMessage = message.data;

      setState(state.copyWith(items: state.items));
    });
  }

  void detachSocketListener() {
    final socketProvider = serviceLocator<SocketProvider>();
    socketProvider.unsubscribeFromNewMessage((SocketNewMessage data) async {
      final item =
          state.items.firstWhere((element) => element.id == data.dialogId);
      final message = await repository.getMessage(data.messageId);
      item.lastMessage = message.data;

      setState(state.copyWith(items: state.items));
    });
  }

  void gotoDialog(BigInt dialogId, BigInt userId, BuildContext context) {
    Navigator.pushNamed(context, RouteService.dialogMessage,
        arguments: [dialogId, userId]);
  }

  Future<void> deleteDialog(BigInt dialogId) async {
    await repository.deleteDialog(dialogId);
    await loadDialogs();
  }
}
