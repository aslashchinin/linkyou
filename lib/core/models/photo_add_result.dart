import 'package:linkyou/core/models/photo_src.dart';

class PhotoAddResult {
  final int id;
  final int userId;
  final String datetime;
  final String description;
  final PhotoSrc src;
  final bool isLiked;
  final int likesCount;
  final int commentsCount;

  PhotoAddResult({
    required this.id,
    required this.userId,
    required this.datetime,
    required this.description,
    required this.src,
    required this.isLiked,
    required this.likesCount,
    required this.commentsCount,
  });

  factory PhotoAddResult.fromJson(Map<String, dynamic> json) {
    return PhotoAddResult(
      id: json['id'],
      userId: json['user_id'],
      datetime: json['datetime'],
      description: json['description'],
      src: PhotoSrc.fromJson(json['src']),
      isLiked: json['is_liked'],
      likesCount: json['likes_count'],
      commentsCount: json['comments_count'],
    );
  }
}
