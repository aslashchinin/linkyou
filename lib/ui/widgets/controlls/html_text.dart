import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlText extends StatelessWidget {
  const HtmlText({
    super.key,
    required this.text,
    this.backgroundColor = const Color(0xFFecf4ff), // Параметризируем цвет фона
    this.padding = const EdgeInsets.all(10.0), // Параметризируем отступы
    this.borderRadius = 12.0, // Параметризируем округлость углов
    this.includeEmojiProcessing = true, // Включаем/выключаем обработку смайлов
  });

  final String text;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double borderRadius;
  final bool includeEmojiProcessing;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      "<div style='white-space: pre-wrap; background-color: ${backgroundColor.value.toRadixString(16)}; padding: ${padding.top}px ${padding.right}px ${padding.bottom}px ${padding.left}px; border-radius: ${borderRadius}px;'>$text</div>",
      customStylesBuilder: (element) {
        final String src = element.attributes['src'] ?? '';
        if (includeEmojiProcessing &&
            element.localName == 'img' &&
            src.contains('emoji')) {
          return {'width': '16px', 'height': '16px'};
        }
        return null;
      },
    );
  }
}
