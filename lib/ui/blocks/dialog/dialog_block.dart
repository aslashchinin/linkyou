import 'package:flutter/material.dart';
import 'package:linkyou/core/base/block_base.dart';
import 'package:linkyou/core/base/state_base.dart';
import 'package:linkyou/models/dialog.dart' as dialog;
import 'package:linkyou/ui/blocks/dialog/dialog_viewmodel.dart';
import 'package:linkyou/ui/widgets/tiles/dialog_tile.dart';
import 'package:linkyou/core/enums/common_loading_enum.dart';
import 'package:linkyou/ui/widgets/controlls/round_button.dart';

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
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              if (index == state.items.length) {
                if (state.status == CommonLoadingStatus.loadingMore) {
                  return buildLoadingState();
                }
                if (state.status == CommonLoadingStatus.end) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: RoundButton(
                    text: 'Загрузить еще',
                    isBlue: true,
                    isOutlined: false,
                    onPressed: () => viewModel.loadMoreDialogs(),
                  ),
                );
              }
              final dialog = state.items[index];
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: ValueKey(dialog.id),
                confirmDismiss: (direction) async {
                  return await _showConfirmationDialog(dialog.id);
                },
                background: Container(
                  color: Colors.red,
                  alignment: AlignmentDirectional.centerEnd,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Text(
                    "Удалить",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                child: GestureDetector(
                  onTap: () => viewModel.gotoDialog(dialog.id),
                  child: DialogTile(dialog: dialog),
                ),
              );
            },
          );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<bool> _showConfirmationDialog(BigInt dialogId) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Подтверждение удаления"),
          content: const Text("Вы уверены, что хотите удалить диалог?"),
          actions: [
            TextButton(
              child: const Text("Отмена"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text("Удалить"),
              onPressed: () {
                viewModel.deleteDialog(dialogId);
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    ).then((value) => value ?? false); // Обработка null
  }
}
