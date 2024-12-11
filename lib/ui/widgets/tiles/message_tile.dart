import 'package:flutter/material.dart';
import 'package:linkyou/models/message.dart';
import 'package:linkyou/core/helpers/pluralizer_helper.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 1, top: 1),
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 1),
        title: Text(
          message.user.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: HtmlWidget(
            "<div style='white-space: pre-wrap; background-color: #ecf4ff !important; padding: 10px; border-radius: 12px;'>${message.comment}</div>",
            customStylesBuilder: (element) {
          final String src = element.attributes['src'] ?? '';

          if (element.localName == 'img' && src.contains('emoji')) {
            return {'width': '16px', 'height': '16px'};
          }

          return null;
        }),
        trailing: Text(PluralizerHelper.formatTime(
            DateTime.parse(message.datetime).toLocal())),
      ),
    );
  }
}
