import 'package:linkyou/models/user_short.dart';
import 'package:linkyou/core/base/model_interface_base.dart';

class Comment implements ModelInterfaceBase {
  final int id;
  final UserShort user;
  final int? postId;
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
      user: UserShort.fromJson(json['user']),
      postId: json['post_id'],
      datetime: DateTime.parse(json['datetime']),
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'post_id': postId,
      'datetime': datetime.toIso8601String(),
      'comment': comment,
    };
  }
}
