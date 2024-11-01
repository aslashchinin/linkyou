class Orientation {
  final int id;
  final String name;

  Orientation({
    required this.id,
    required this.name,
  });

  factory Orientation.fromJson(Map<String, dynamic> json) {
    return Orientation(
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
