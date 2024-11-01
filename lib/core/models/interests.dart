class Interests {
  final int id;
  final List<String> interests;

  Interests({
    required this.id,
    required this.interests,
  });

  factory Interests.fromJson(Map<String, dynamic> json) {
    return Interests(
      id: json['id'],
      interests: List<String>.from(
        (json['interests'] as List)
            .where((element) => (element as String).trim().isNotEmpty)
            .toList(),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'interests': List<dynamic>.from(interests.map((x) => x)),
    };
  }
}
