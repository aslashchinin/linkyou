import 'package:flutter/material.dart';
import 'package:linkyou/core/models/ublog_post.dart';
import 'package:linkyou/views/widgets/tiles/user_avatar_tile.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:linkyou/views/widgets/tiles/video_tile.dart';
import 'package:linkyou/core/helpers/pluralizer_helper.dart';
import 'package:linkyou/core/helpers/build_helper.dart';

class UblogTile extends StatelessWidget {
  const UblogTile({required this.ublogPost, super.key});

  final UblogPost ublogPost;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey[300],
          height: 1,
        ),
        const SizedBox(height: 15),
        // ******
        // Avatar
        // ******
        UserAvatarTile(
          user: ublogPost.user,
          additionalText: DateFormat('dd MMMM yyyy, HH:mm')
              .format(DateTime.parse(ublogPost.datetime)),
        ),
        const SizedBox(height: 15),
        // ******
        // Text with emoji
        // ******
        HtmlWidget(
            "<div style='white-space: pre-wrap;'>${ublogPost.text}</div>",
            customStylesBuilder: (element) {
          final String src = element.attributes['src'] ?? '';

          if (element.localName == 'img' && src.contains('emoji')) {
            return {'width': '16px', 'height': '16px'};
          }
          return null;
        }),
        const SizedBox(height: 15),
        // ******
        // Photos
        // ******
        ublogPost.photos.isNotEmpty
            ? BuildHelper.buildPhotoGallery(
                ublogPost.photos.map((photo) => photo.src).toList(), context)
            : const SizedBox(),
        const SizedBox(height: 15),
        // ******
        // Videos
        // ******
        ublogPost.videoLink.isNotEmpty
            ? VideoTile(videoLink: ublogPost.videoLink)
            : const SizedBox(),
        Divider(
          color: Colors.grey[300],
          height: 1,
        ),
        const SizedBox(height: 10),
        // ******************
        // Likes and comments
        // ******************
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.favorite_border, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                    PluralizerHelper.getCount(
                        ublogPost.likesCount, 'лайк', 'лайка', 'лайков'),
                    style: const TextStyle(fontSize: 14)),
                const SizedBox(width: 16),
                const Icon(Icons.comment, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                    PluralizerHelper.getCount(ublogPost.commentsCount,
                        'комментарий', 'комментария', 'комментариев'),
                    style: const TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.visibility, color: Colors.grey),
                const SizedBox(width: 4),
                Text(ublogPost.viewsCount.toString(),
                    style: const TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
