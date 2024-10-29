import 'package:linkyou/core/base/users_block_viewmodel_base.dart';

class UsersDailyViewModel extends BaseUsersViewModel {
  UsersDailyViewModel({required super.repository});

  int cityId = 0;

  Future<void> loadDailyUsers({int cityId = 0}) async {
    await handleUsersLoading(
      loadFunction: () => repository.getDailyUsers(cityId: cityId),
    );

    this.cityId = cityId;
  }

  Future<void> loadMoreUsers({int cityId = 0}) async {
    await handleUsersLoading(
      loadFunction: () => repository.getDailyUsers(
        page: currentListPage + 1,
        cityId: this.cityId,
      ),
      isLoadMore: true,
    );
  }
}
