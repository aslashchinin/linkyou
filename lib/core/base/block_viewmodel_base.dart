import 'package:flutter/material.dart';
import 'package:linkyou/core/base/repository_interface_base.dart';
import 'package:linkyou/core/base/state_base.dart';
import 'package:linkyou/core/enums/common_loading_enum.dart';
import 'package:linkyou/core/base/model_interface_base.dart';

abstract class BlockViewModelBase<M extends ModelInterfaceBase,
    R extends RepositoryInterfaceBase> extends ChangeNotifier {
  BlockViewModelBase({required R repository}) : _repository = repository;

  @protected
  final R _repository;

  R get repository => _repository;

  BaseState<M> _state = BaseState<M>();
  BaseState<M> get state => _state;

  int _currentListPage = 0;
  int get currentListPage => _currentListPage;

  set currentListPage(int value) {
    _currentListPage = value;
    notifyListeners();
  }

  @protected
  void setState(BaseState<M> newState) {
    _state = newState;
    notifyListeners();
  }

  @protected
  void setCurrentPage(int page) {
    _currentListPage = page;
  }

  @protected
  Future<void> handleItemsLoading({
    required Future<dynamic> Function() loadFunction,
    bool isLoadMore = false,
  }) async {
    try {
      setState(_state.copyWith(
        status: isLoadMore
            ? CommonLoadingStatus.loadingMore
            : CommonLoadingStatus.loading,
      ));

      final repositoryResponse = await loadFunction();
      setCurrentPage(repositoryResponse.pagination.currentPage);

      final updatedItems = isLoadMore
          ? [..._state.items, ...repositoryResponse.data]
          : [...repositoryResponse.data];

      setState(_state.copyWith(
        status: repositoryResponse.pagination.isEnd
            ? CommonLoadingStatus.end
            : CommonLoadingStatus.loaded,
        items: updatedItems.cast<M>(),
      ));
    } catch (e, stackTrace) {
      setState(_state.copyWith(
        status: CommonLoadingStatus.error,
        errorMessage: stackTrace.toString(),
      ));
    }
  }

  void clearState() {
    setState(BaseState<M>());
  }
}
