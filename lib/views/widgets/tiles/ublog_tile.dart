import 'package:flutter/material.dart';
import 'package:linkyou/core/models/ublog_post.dart';
import 'package:linkyou/views/widgets/tiles/user_avatar_tile.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:linkyou/views/widgets/tiles/video_tile.dart';
import 'package:linkyou/views/widgets/tiles/ublog_photo_tail.dart';

class UblogTile extends StatelessWidget {
  const UblogTile({required this.ublog, super.key});

  final UblogPost ublog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey[300],
          height: 1,
        ),
        const SizedBox(height: 15),
        UserAvatarTile(
          user: ublog.user,
          additionalText: DateFormat('dd MMMM yyyy, HH:mm')
              .format(DateTime.parse(ublog.datetime)),
        ),
        const SizedBox(height: 15),
        HtmlWidget(ublog.text, customStylesBuilder: (element) {
          final String src = element.attributes['src'] ?? '';

          if (element.localName == 'img' && src.contains('emoji')) {
            return {'width': '16px', 'height': '16px'};
          }
          return null;
        }),
        const SizedBox(height: 15),
        ublog.photos.isNotEmpty
            ? Row(
                children: ublog.photos
                    .map((photo) => UblogPhotoTail(photo: photo))
                    .toList(),
              )
            : const SizedBox(),
        const SizedBox(height: 15),
        ublog.videoLink.isNotEmpty
            ? VideoTile(videoLink: ublog.videoLink)
            : const SizedBox(),
        Divider(
          color: Colors.grey[300],
          height: 1,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.favorite_border, color: Colors.grey),
                const SizedBox(width: 4),
                Text('${ublog.likesCount} лайк',
                    style: const TextStyle(fontSize: 14)),
                const SizedBox(width: 16),
                const Icon(Icons.comment, color: Colors.grey),
                const SizedBox(width: 4),
                Text('${ublog.commentsCount} комментариев',
                    style: const TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.visibility, color: Colors.grey),
                const SizedBox(width: 4),
                Text('${ublog.viewsCount}',
                    style: const TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
