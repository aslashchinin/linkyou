import 'package:linkyou/models/src.dart';
import 'package:linkyou/core/base/model_interface_base.dart';

class Photo implements ModelInterfaceBase {
  final int id;
  final BigInt userId;
  final String datetime;
  final String description;
  final Src src;
  final bool isLiked;
  final int likesCount;
  final int commentsCount;

  // Конструктор модели
  Photo({
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
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
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