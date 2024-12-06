class Visibility {
  final int id;
  final String name;

  Visibility({
    required this.id,
    required this.name,
  });

  factory Visibility.fromJson(Map<String, dynamic> json) {
    return Visibility(
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
