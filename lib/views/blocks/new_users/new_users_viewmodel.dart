import 'package:linkyou/core/base/users_block_viewmodel_base.dart';

class NewUsersViewModel extends BaseUsersViewModel {
  NewUsersViewModel({required super.repository});

  Future<void> loadNewUsers() async {
    await handleUsersLoading(
      loadFunction: () => repository.getNewUsers(),
    );
  }

  Future<void> loadMoreUsers() async {
    await handleUsersLoading(
      loadFunction: () => repository.getNewUsers(
        page: currentListPage + 1,
      ),
      isLoadMore: true,
    );
  }
}
