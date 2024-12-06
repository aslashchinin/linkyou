import 'user_short.dart';
import 'ublog_photo.dart';

class UblogPost {
  final int id;
  final UserShort user;
  final String text;
  final String textShort;
  final List<String> tags;
  final List<UblogPhoto> photos;
  final String videoLink;
  final String audioLink;
  final int commentsCount;
  final int viewsCount;
  final int likesCount;
  final bool isLiked;
  final bool isPinned;
  final String datetime;

  UblogPost({
    required this.id,
    required this.user,
    required this.text,
    required this.textShort,
    required this.tags,
    required this.photos,
    required this.videoLink,
    required this.audioLink,
    required this.commentsCount,
    required this.viewsCount,
    required this.likesCount,
    required this.isLiked,
    required this.isPinned,
    required this.datetime,
  });

  factory UblogPost.fromJson(Map<String, dynamic> json) {
    return UblogPost(
      id: json['id'],
      user: UserShort.fromJson(json['user']),
      text: json['text'],
      textShort: json['text_short'],
      tags: List<String>.from(json['tags']),
      photos: (json['photos'] as List)
          .map((photo) => UblogPhoto.fromJson(photo))
          .toList(),
      videoLink: json['video_link'],
      audioLink: json['audio_link'],
      commentsCount: json['comments_count'],
      viewsCount: json['views_count'],
      likesCount: json['likes_count'],
      isLiked: json['is_liked'],
      isPinned: json['is_pinned'],
      datetime: json['datetime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'text': text,
      'text_short': textShort,
      'tags': tags,
      'photos': photos.map((photo) => photo.toJson()).toList(),
      'video_link': videoLink,
      'audio_link': audioLink,
      'comments_count': commentsCount,
      'views_count': viewsCount,
      'likes_count': likesCount,
      'is_liked': isLiked,
      'is_pinned': isPinned,
      'datetime': datetime,
    };
  }
}
