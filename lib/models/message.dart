import 'package:linkyou/models/user_short.dart'; // Импортируем модель UserShort
import 'package:linkyou/core/base/model_interface_base.dart';

class Message implements ModelInterfaceBase {
  final int id;
  final int dialogId;
  final UserShort user; // Используем модель UserShort
  final String comment;
  final String commentIOS;
  final List<String> pictures; // Список картинок
  final bool read;
  final String datetime;

  // Конструктор модели
  Message({
    required this.id,
    required this.dialogId,
    required this.user,
    required this.comment,
    required this.commentIOS,
    required this.pictures,
    required this.read,
    required this.datetime,
  });

  // Функция, преобразующая JSON в объект модели
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      dialogId: json['dialog_id'],
      user: UserShort.fromJson(json['user']), // Преобразуем юзера
      comment: json['comment'],
      commentIOS: json['comment_ios'],
      pictures: List<String>.from(
          json['pictures'] ?? []), // Преобразуем список картинок
      read: json['read'],
      datetime: json['datetime'],
    );
  }

  // Функция, преобразующая объект модели обратно в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dialog_id': dialogId,
      'user': user.toJson(), // Преобразуем юзера обратно в JSON
      'comment': comment,
      'comment_ios': commentIOS,
      'pictures': pictures,
      'read': read,
      'datetime': datetime,
    };
  }
}
