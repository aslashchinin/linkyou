class Gift {
  final int id;
  final String name;
  final int cost;
  final String picture;

  // Конструктор модели
  Gift({
    required this.id,
    required this.name,
    required this.cost,
    required this.picture,
  });

  // Функция, преобразующая JSON в объект модели
  factory Gift.fromJson(Map<String, dynamic> json) {
    return Gift(
      id: json['id'],
      name: json['name'],
      cost: json['cost'],
      picture: json['picture'],
    );
  }

  // Функция, преобразующая объект модели обратно в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cost': cost,
      'picture': picture,
    };
  }
}