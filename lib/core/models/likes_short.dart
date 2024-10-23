class LikesShort {
  final int count;

  LikesShort({
    required this.count,
  });

  factory LikesShort.fromJson(Map<String, dynamic> json) {
    return LikesShort(
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
    };
  }
}
