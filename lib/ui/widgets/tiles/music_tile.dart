import 'package:flutter/material.dart';
import 'package:linkyou/models/music.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({required this.music, this.height = '', super.key});

  final Music music;
  final String height;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: HtmlWidget(
          '<iframe height="$height" width="400" frameborder="0" src="${music.source}" title="${music.source}"></iframe>'),
    );
  }
}
