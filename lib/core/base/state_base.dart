import 'package:linkyou/core/enums/common_loading_enum.dart';
import 'package:linkyou/core/base/model_interface_base.dart';

class BaseState<M extends ModelInterfaceBase> {
  final List<M> items;
  final CommonLoadingStatus status;
  final String? errorMessage;

  BaseState({
    this.items = const [],
    this.status = CommonLoadingStatus.initial,
    this.errorMessage,
  });

  BaseState<M> copyWith({
    List<M>? items,
    CommonLoadingStatus? status,
    String? errorMessage,
  }) {
    return BaseState(
      items: items ?? this.items,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
