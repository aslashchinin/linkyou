class Alcohol {
  final int id;
  final String name;

  Alcohol({
    required this.id,
    required this.name,
  });

  factory Alcohol.fromJson(Map<String, dynamic> json) {
    return Alcohol(
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
