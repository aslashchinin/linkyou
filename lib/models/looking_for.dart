class LookingFor {
  final int id;
  final String name;

  LookingFor({
    required this.id,
    required this.name,
  });

  factory LookingFor.fromJson(Map<String, dynamic> json) {
    return LookingFor(
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
