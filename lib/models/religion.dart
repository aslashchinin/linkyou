class Religion {
  final int id;
  final String name;
  final String status;

  Religion({
    required this.id,
    required this.name,
    required this.status,
  });

  factory Religion.fromJson(Map<String, dynamic> json) {
    return Religion(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
    };
  }
}
