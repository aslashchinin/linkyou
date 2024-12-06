import 'package:flutter/material.dart';
import 'package:linkyou/core/helpers/pluralizer_helper.dart';
import 'package:linkyou/models/comment.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({required this.comment, super.key});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 1, top: 1),
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 1),
        leading: Padding(
          padding: const EdgeInsets.only(top: 1.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(comment.user.avatar.src.origin),
          ),
        ),
        title: Text(
          comment.user.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: HtmlWidget(
            "<div style='white-space: pre-wrap; background-color: #ecf4ff !important; padding: 10px; border-radius: 12px;'>${comment.comment}</div>",
            customStylesBuilder: (element) {
          final String src = element.attributes['src'] ?? '';

          if (element.localName == 'img' && src.contains('emoji')) {
            return {'width': '16px', 'height': '16px'};
          }

          return null;
        }),
        trailing: Text(PluralizerHelper.formatDate(comment.datetime)),
      ),
    );
  }
}
