class Src {
  final String small;
  final String defaultSrc;
  final String origin;
  final String? square;

  Src({
    required this.small,
    required this.defaultSrc,
    required this.origin,
    required this.square,
  });

  factory Src.fromJson(Map<String, dynamic> json) {
    return Src(
      small: fixUrl(json['small']),
      defaultSrc: fixUrl(json['default']),
      origin: fixUrl(json['origin']),
      square: fixUrl(json['square'] ?? ""),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'small': small,
      'default': defaultSrc,
      'origin': origin,
      'square': square,
    };
  }

  static String fixUrl(String url) {
    if (url.startsWith('//')) {
      return 'https:$url';
    }
    return url;
  }
}
