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
      small: _fixUrl(json['small']),
      defaultSrc: _fixUrl(json['default']),
      origin: _fixUrl(json['origin']),
      square: _fixUrl(json['square'] ?? ""),
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

  // Метод для исправления URL
  static String _fixUrl(String url) {
    if (url.startsWith('//')) {
      return 'https:$url'; // Добавляем https: если URL начинается с //
    }
    return url;
  }
}
