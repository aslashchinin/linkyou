import 'visibility.dart';

class Nationality {
  final int id;
  final String name;
  final int sorting;
  final bool deleted;
  final Visibility visibility;

  Nationality({
    required this.id,
    required this.name,
    required this.sorting,
    required this.deleted,
    required this.visibility,
  });

  factory Nationality.fromJson(Map<String, dynamic> json) {
    return Nationality(
      id: json['id'],
      name: json['name'],
      sorting: json['sorting'],
      deleted: json['deleted'],
      visibility: Visibility.fromJson(json['visibility']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sorting': sorting,
      'deleted': deleted,
      'visibility': visibility.toJson(),
    };
  }
}
