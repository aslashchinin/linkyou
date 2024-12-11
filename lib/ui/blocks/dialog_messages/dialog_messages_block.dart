import 'package:flutter/material.dart';
import 'package:linkyou/core/base/block_base.dart';
import 'package:linkyou/core/base/state_base.dart';
import 'package:linkyou/models/message.dart';
import 'dialog_messages_viewmodel.dart';
import 'package:linkyou/ui/widgets/tiles/message_tile.dart';

class DialogMessagesBlock extends BlockBase<DialogMessagesBlock> {
  const DialogMessagesBlock({super.key, required this.dialogId});

  final BigInt dialogId;

  @override
  DialogMessagesBlockState createState() => DialogMessagesBlockState();
}

class DialogMessagesBlockState extends BlockBaseState<DialogMessagesBlock,
    DialogMessagesViewModel, Message> {
  @override
  void initializeData() {
    viewModel.loadDialogMessages(widget.dialogId);

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
    viewModel.loadDialogMessages(widget.dialogId);
  }

  @override
  StateBase<Message> getState() => viewModel.state;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget buildLoadedState(StateBase<Message> state) {
    return state.items.isEmpty
        ? const Center(
            child: Text('Пока нет сообщений'),
          )
        : ListView.builder(
            controller: _scrollController,
            reverse: true,
            itemCount: state.items.length,
            itemBuilder: (context, index) =>
                MessageTile(message: state.items[index]),
          );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
