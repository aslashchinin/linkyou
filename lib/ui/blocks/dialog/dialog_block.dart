import 'package:flutter/material.dart';
import 'package:linkyou/core/base/block_base.dart';
import 'package:linkyou/core/base/state_base.dart';
import 'package:linkyou/models/dialog.dart' as dialog;
import 'package:linkyou/ui/blocks/dialog/dialog_viewmodel.dart';
import 'package:linkyou/ui/widgets/tiles/dialog_tile.dart';

class DialogBlock extends BlockBase<DialogBlock> {
  DialogBlock({super.key});

  @override
  DialogBlockState createState() => DialogBlockState();
}

class DialogBlockState
    extends BlockBaseState<DialogBlock, DialogViewModel, dialog.Dialog> {
  @override
  void initializeData() {
    viewModel.loadDialogs();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onRefreshPressed() {
    viewModel.loadDialogs();
  }

  @override
  StateBase<dialog.Dialog> getState() => viewModel.state;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget buildLoadedState(StateBase<dialog.Dialog> state) {
    return state.items.isEmpty
        ? const Center(
            child: Text('Пока нет диалогов'),
          )
        : ListView.builder(
            controller: _scrollController,
            reverse: true,
            itemCount: state.items.length,
            itemBuilder: (context, index) =>
                DialogTile(dialog: state.items[index]),
          );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
