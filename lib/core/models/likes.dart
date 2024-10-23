class Likes {
  final int count;
  final bool isLiked;

  Likes({
    required this.count,
    required this.isLiked,
  });

  factory Likes.fromJson(Map<String, dynamic> json) {
    return Likes(
      count: json['count'],
      isLiked: json['is_liked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'is_liked': isLiked,
    };
  }
}
