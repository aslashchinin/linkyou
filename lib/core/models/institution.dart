class Institution {
  final int id;
  final BigInt userId;
  final String name;
  final bool active;
  final bool deleted;

  Institution({
    required this.id,
    required this.userId,
    required this.name,
    required this.active,
    required this.deleted,
  });

  factory Institution.fromJson(Map<String, dynamic> json) {
    return Institution(
      id: json['id'],
      userId: BigInt.from(json['user_id']),
      name: json['name'],
      active: json['active'],
      deleted: json['deleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
    };
  }
}
