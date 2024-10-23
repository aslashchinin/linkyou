class Zodiac {
  final String name;
  final String id;

  Zodiac({
    required this.name,
    required this.id,
  });

  factory Zodiac.fromJson(Map<String, dynamic> json) {
    return Zodiac(
      name: json['name'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}
