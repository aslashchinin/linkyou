class Finance {
  final int? id;
  final String? name;

  Finance({
    this.id,
    this.name,
  });

  factory Finance.fromJson(Map<String, dynamic> json) {
    return Finance(
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
