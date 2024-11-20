import 'package:linkyou/core/models/src.dart';

class UserGift {
  final int id;
  final BigInt userId;
  final String datetime;
  final String description;
  final Src src;
  final bool isLiked;
  final int likesCount;
  final int commentsCount;

  // Конструктор модели
  UserGift({
    required this.id,
    required this.userId,
    required this.datetime,
    required this.description,
    required this.src,
    required this.isLiked,
    required this.likesCount,
    required this.commentsCount,
  });

  // Функция, преобразующая JSON в объект модели
  factory UserGift.fromJson(Map<String, dynamic> json) {
    return UserGift(
      id: json['id'],
      userId: BigInt.from(json['user_id']),
      datetime: json['datetime'],
      description: json['description'] ?? "",
      src: Src.fromJson(json['src']),
      isLiked: json['is_liked'],
      likesCount: json['likes_count'],
      commentsCount: json['comments_count'],
    );
  }

  // Функция, преобразующая объект модели обратно в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'datetime': datetime,
      'description': description,
      'src': src.toJson(),
      'is_liked': isLiked,
      'likes_count': likesCount,
      'comments_count': commentsCount,
    };
  }
}