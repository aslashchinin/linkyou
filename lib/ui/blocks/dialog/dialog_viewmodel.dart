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
}
