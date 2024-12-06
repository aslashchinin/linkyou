import 'package:linkyou/models/photo.dart';
import 'package:linkyou/data/photo/photo_repository_interface.dart';
import 'package:linkyou/core/base/block_viewmodel_base.dart';

class UserPhotoViewModel
    extends BlockViewModelBase<Photo, PhotoRepositoryInterface> {
  UserPhotoViewModel({required super.repository});

  
  Future<void> loadUserPhotos(BigInt id) async {
    await handleItemsLoading(
      loadFunction: () => repository.getPhotosList(id),
    );
  }
}
