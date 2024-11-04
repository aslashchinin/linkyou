class Pet {
  final int id;
  final int userId;
  final String name;
  final String type;
  final String description;
  final String avatar;

  Pet({
    required this.id,
    required this.userId,
    required this.name,
    required this.type,
    required this.description,
    required this.avatar,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      type: json['type'],
      description: json['description'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'type': type,
      'description': description,
      'avatar': avatar,
    };
  }
}
