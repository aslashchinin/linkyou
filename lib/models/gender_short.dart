class GenderShort {
  final int id;
  final String name;

  GenderShort({
    required this.id,
    required this.name,
  });

  factory GenderShort.fromJson(Map<String, dynamic> json) {
    return GenderShort(
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
