// Модель для данных внутри поля "src"
class PhotoSrc {
  final String small;
  final String defaultImage;
  final String origin;

  // Конструктор модели
  PhotoSrc({
    required this.small,
    required this.defaultImage,
    required this.origin,
  });

  // Функция, преобразующая JSON в объект модели
  factory PhotoSrc.fromJson(Map<String, dynamic> json) {
    return PhotoSrc(
      small: json['small'],
      defaultImage: json['default'],
      origin: json['origin'],
    );
  }

  // Функция, преобразующая объект модели обратно в JSON
  Map<String, dynamic> toJson() {
    return {
      'small': small,
      'default': defaultImage,
      'origin': origin,
    };
  }
}