import 'package:linkyou/data/photo/photo_repository_interface.dart';
import 'package:linkyou/core/base/block_viewmodel_base.dart';
import 'package:linkyou/models/comment.dart';
import 'package:linkyou/models/photo_comment_input.dart';

class PhotoCommentsViewModel
    extends BlockViewModelBase<Comment, PhotoRepositoryInterface> {
  PhotoCommentsViewModel({required super.repository});

  Future<void> loadPhotoComments(int photoId) async {
    await handleItemsLoading(
      loadFunction: () => repository.getPhotoComments(photoId),
    );
  }

  Future<void> sendComment(int photoId, String comment) async {
    await handleItemsLoading(
        loadFunction: () => repository.addPhotoComment(
            photoId, PhotoCommentInput(comment: comment)),
        isLoadMore: true,
        isReverse: true);
  }
}
