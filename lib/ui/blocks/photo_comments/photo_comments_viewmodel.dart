import 'package:linkyou/data/photo/photo_repository_interface.dart';
import 'package:linkyou/core/base/block_viewmodel_base.dart';
import 'package:linkyou/models/comment.dart';

class PhotoCommentsViewModel
    extends BlockViewModelBase<Comment, PhotoRepositoryInterface> {
  PhotoCommentsViewModel({required super.repository});

  Future<void> loadPhotoComments(int photoId) async {
    await handleItemsLoading(
      loadFunction: () => repository.getPhotoComments(photoId),
    );
  }
}
