import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class VideoTile extends StatelessWidget {
  const VideoTile({super.key, required this.videoLink});

  final String videoLink;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
        '<iframe src="$videoLink" title="YouTube video" frameBorder="0" allow="autoplay; encrypted-media" allowfullscreen=""></iframe>');
  }
}
