class Result {
  final bool isSuccess;

  Result({required this.isSuccess});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      isSuccess: json['done'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'done': isSuccess,
    };
  }
}
