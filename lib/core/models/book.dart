class Book {
  final int id;
  final BigInt userId;
  final String name;
  final String author;
  final bool deleted;
  final String lastUpdate;

  Book({
    required this.id,
    required this.userId,
    required this.name,
    required this.author,
    required this.deleted,
    required this.lastUpdate,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      userId: BigInt.from(json['user_id']),
      name: json['name'],
      author: json['author'],
      deleted: json['deleted'] == "true", // учитывая, что в JSON это строка
      lastUpdate: json['last_update'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'author': author,
      'deleted': deleted.toString(), // преобразуем булевый в строку для JSON
      'last_update': lastUpdate,
    };
  }
}
