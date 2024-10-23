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
      score: json['score'],
      likes: json['likes'],
      views: json['views'],
      code: json['code'],
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
