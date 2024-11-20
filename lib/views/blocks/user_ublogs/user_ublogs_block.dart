import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user.dart';
import 'package:linkyou/views/widgets/controlls/circular_progress_blue.dart';
import 'package:linkyou/views/widgets/tiles/ublog_tile.dart';
import 'package:provider/provider.dart';
import 'user_ublogs_viewmodel.dart';
import 'package:linkyou/core/helpers/pluralizer_helper.dart';
import 'package:linkyou/views/widgets/controlls/round_button.dart';

class UserUblogsBlock extends StatefulWidget {
  const UserUblogsBlock({super.key, required this.user});

  final User user;

  @override
  State<UserUblogsBlock> createState() => _UserUblogsBlockState();
}

class _UserUblogsBlockState extends State<UserUblogsBlock> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserUblogsViewModel>(context, listen: false)
        .loadUserUblogs(widget.user.id, 1);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserUblogsViewModel>(context);

    return viewModel.ublogs.isEmpty
        ? const Center(child: CircularProgressBlue())
        : Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.article, color: Colors.grey[700]),
                    const SizedBox(width: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Блог',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          PluralizerHelper.getCount(widget.user.ubLogsCount,
                              'запись', 'записи', 'записей'),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: viewModel.ublogs
                      .asMap()
                      .entries
                      .take(3)
                      .map((entry) => UblogTile(ublog: entry.value))
                      .toList(),
                ),
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: RoundButton(
                      text: 'Все записи',
                      isBlue: true,
                      onPressed: () =>
                          viewModel.navigateToUblogs(context, widget.user.id),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
