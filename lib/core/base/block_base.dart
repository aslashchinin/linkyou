import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/ui/widgets/controlls/circular_progress_blue.dart';
import 'package:linkyou/core/base/state_base.dart';
import 'package:linkyou/core/enums/common_loading_enum.dart';
import 'package:linkyou/core/base/model_interface_base.dart';

abstract class BaseBlock<T> extends StatefulWidget {
  const BaseBlock({super.key});
}

abstract class BaseBlockState<BB extends BaseBlock, VM extends ChangeNotifier,
    M extends ModelInterfaceBase> extends State<BB> {
  late VM viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeData();
    });
  }

  BaseState<M> getState();

  void initializeData();

  Widget buildLoadingState() {
    return const CircularProgressBlue();
  }

  Widget buildErrorState(String? errorMessage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (errorMessage != null)
            Text(
              'Error: $errorMessage',
              style: const TextStyle(color: Colors.red),
            ),
          ElevatedButton(
            onPressed: onRefreshPressed,
            child: const Text('Обновить'),
          ),
        ],
      ),
    );
  }

  Widget buildLoadedState(BaseState<M> state);
  void onRefreshPressed();

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<VM>(context, listen: true);
    final state = getState();

    switch (state.status) {
      case CommonLoadingStatus.initial:
      case CommonLoadingStatus.loading:
        return buildLoadingState();
      case CommonLoadingStatus.loaded:
      case CommonLoadingStatus.loadingMore:
      case CommonLoadingStatus.end:
        return buildLoadedState(state);
      case CommonLoadingStatus.error:
        return buildErrorState(state.errorMessage);
    }
  }
}
