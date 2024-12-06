import 'package:linkyou/models/user.dart';

class Comment {
  final int id;
  final User user; // использование модели User
  final int postId;
  final DateTime datetime;
  final String comment;

  Comment({
    required this.id,
    required this.user,
    required this.postId,
    required this.datetime,
    required this.comment,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      user: User.fromJson(json['user']),
      postId: json['post_id'],
      datetime: DateTime.parse(json['datetime']),
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(), // преобразование объекта User обратно в JSON
      'post_id': postId,
      'datetime': datetime.toIso8601String(),
      'comment': comment,
    };
  }
}
