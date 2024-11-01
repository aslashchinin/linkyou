import 'package:linkyou/core/models/gift.dart';

class Gifts {
  final int id;
  final String name;
  final List<Gift> items;

  Gifts({
    required this.id,
    required this.name,
    required this.items,
  });

  // Функция, преобразующая JSON в объект модели
  factory Gifts.fromJson(Map<String, dynamic> json) {
    return Gifts(
      id: json['id'],
      name: json['name'],
      items: List<Gift>.from(json['items'].map((item) => Gift.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}