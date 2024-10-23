class Children {
  final int id;
  final String name;

  Children({
    required this.id,
    required this.name,
  });

  factory Children.fromJson(Map<String, dynamic> json) {
    return Children(
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
