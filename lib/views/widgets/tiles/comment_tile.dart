import 'package:flutter/material.dart';
import 'package:linkyou/core/models/comment.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

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
            backgroundImage: NetworkImage(
                comment.user.avatar.src.origin), // Замените на вашу ссылку
          ),
        ),
        title: Text(
          comment.user.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFf6f8fb),
            borderRadius: BorderRadius.circular(30),
          ),
          child: HtmlWidget(
              "<div style='white-space: pre-wrap;'>${comment.comment}</div>",
              customStylesBuilder: (element) {
            final String src = element.attributes['src'] ?? '';

            if (element.localName == 'img' && src.contains('emoji')) {
              return {'width': '16px', 'height': '16px'};
            }
            return null;
          }),
        ),
        trailing: Text(DateFormat('HH:mm').format(comment.datetime)),
      ),
    );
  }
}
