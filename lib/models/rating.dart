class Rating {
  final double score;
  final int likes;
  final int views;
  final String code;

  Rating({
    required this.score,
    required this.likes,
    required this.views,
    required this.code,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      score: (json['score'] ?? 0.0) + 0.0,
      likes: (json['likes'] ?? 0) + 0,
      views: (json['views'] ?? 0) + 0,
      code: json['code'] ?? 'error',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'likes': likes,
      'views': views,
      'code': code,
    };
  }
}
