import 'package:linkyou/core/base/block_viewmodel_base.dart';
import 'package:linkyou/data/dialog/dialog_repository_interface.dart';
import 'package:linkyou/core/services/route_service.dart';
import 'package:linkyou/models/dialog.dart' as dialog_library;
import 'package:flutter/material.dart';

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

  void gotoDialog(BigInt dialogId, BuildContext context) {
    Navigator.pushNamed(context, RouteService.dialogMessage,
        arguments: dialogId);
  }

  Future<void> deleteDialog(BigInt dialogId) async {
    await repository.deleteDialog(dialogId);
    await loadDialogs();
  }
}
