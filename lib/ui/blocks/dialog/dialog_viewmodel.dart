import 'package:linkyou/core/base/block_viewmodel_base.dart';
import 'package:linkyou/data/dialog/dialog_repository_interface.dart';
import 'package:linkyou/models/dialog.dart';

class DialogViewModel
    extends BlockViewModelBase<Dialog, DialogRepositoryInterface> {
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

  void gotoDialog(BigInt dialogId) {
    // Goto dialog messages
    print('Goto dialog messages $dialogId');
  }

  Future<void> deleteDialog(BigInt dialogId) async {
    await repository.deleteDialog(dialogId);
    await loadDialogs();
  }
}
