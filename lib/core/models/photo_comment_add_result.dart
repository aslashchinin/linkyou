import 'package:linkyou/core/models/user_short.dart';

class PhotoCommentAddResult {
  final int id;
  final UserShort user;
  final String datetime;
  final String comment;

  PhotoCommentAddResult({
    required this.id,
    required this.user,
    required this.datetime,
    required this.comment,
  });

  factory PhotoCommentAddResult.fromJson(Map<String, dynamic> json) {
    return PhotoCommentAddResult(
      id: json['id'],
      user: UserShort.fromJson(json['user']),
      datetime: json['datetime'],
      comment: json['comment'],
    );
  }
}
