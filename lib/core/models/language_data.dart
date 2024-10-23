class LanguageData {
  final bool deleted;
  final int id;
  final int sorting;
  final String name;

  LanguageData({
    required this.deleted,
    required this.id,
    required this.sorting,
    required this.name,
  });

  factory LanguageData.fromJson(Map<String, dynamic> json) {
    return LanguageData(
      deleted: json['deleted'],
      id: json['id'],
      sorting: json['sorting'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deleted': deleted,
      'id': id,
      'sorting': sorting,
      'name': name,
    };
  }
}
