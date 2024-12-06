class Article {
  final int id;
  final String name;
  final String code;
  final String text;
  final String textShort;
  final DateTime datetime;
  final int commentsCount;
  final String description;
  final int likesCount;
  final bool isLiked;

  Article({
    required this.id,
    required this.name,
    required this.code,
    required this.text,
    required this.textShort,
    required this.datetime,
    required this.commentsCount,
    required this.description,
    required this.likesCount,
    required this.isLiked,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      text: json['text'],
      textShort: json['text_short'],
      datetime: DateTime.parse(json['datetime']),
      commentsCount: json['comments_count'],
      description: json['description'],
      likesCount: json['likes_count'],
      isLiked: json['is_liked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'text': text,
      'text_short': textShort,
      'datetime': datetime.toIso8601String(),
      'comments_count': commentsCount,
      'description': description,
      'likes_count': likesCount,
      'is_liked': isLiked,
    };
  }
}
