class Like {
  bool isLiked;

  Like({required this.isLiked});

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(isLiked: json['isLiked']);
  }

  Map<String, dynamic> toJson() {
    return {
      'isLiked': isLiked,
    };
  }
}
