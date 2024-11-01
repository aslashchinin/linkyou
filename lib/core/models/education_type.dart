class EducationType {
  final int id;
  final String name;

  EducationType({
    required this.id,
    required this.name,
  });

  factory EducationType.fromJson(Map<String, dynamic> json) {
    return EducationType(
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
