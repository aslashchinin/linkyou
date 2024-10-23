class Smoking {
  final int id;
  final String name;

  Smoking({
    required this.id,
    required this.name,
  });

  factory Smoking.fromJson(Map<String, dynamic> json) {
    return Smoking(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
