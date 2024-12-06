import 'user.dart';

class UblogComment {
  final int id;
  final User user;
  final String datetime;
  final String comment;

  UblogComment({
    required this.id,
    required this.user,
    required this.datetime,
    required this.comment,
  });

  factory UblogComment.fromJson(Map<String, dynamic> json) {
    return UblogComment(
      id: json['id'],
      user: User.fromJson(json['user']),
      datetime: json['datetime'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'datetime': datetime,
      'comment': comment,
    };
  }
}
