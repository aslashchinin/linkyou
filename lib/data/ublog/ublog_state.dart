import 'package:linkyou/core/enums/common_loading_enum.dart';
import 'package:linkyou/models/ublog_post.dart';

class UblogState {
  final List<UblogPost> ublogs;
  final CommonLoadingStatus status;
  final String? errorMessage;

  UblogState({
    this.ublogs = const [],
    this.status = CommonLoadingStatus.initial,
    this.errorMessage,
  });

  UblogState copyWith({
    List<UblogPost>? ublogs,
    CommonLoadingStatus? status,
    String? errorMessage,
  }) {
    return UblogState(
      ublogs: ublogs ?? this.ublogs,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
