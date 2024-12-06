class Age {
  final int from;
  final int to;

  Age({
    required this.from,
    required this.to,
  });

  factory Age.fromJson(Map<String, dynamic> json) {
    return Age(
      from: json['from'],
      to: json['to'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
    };
  }
}
