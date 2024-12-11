import 'package:linkyou/core/base/model_interface_base.dart';
import 'package:linkyou/models/user_short.dart'; // Импортируем модель UserShort
import 'package:linkyou/models/message.dart'; // Импортируем модель Message

class Dialog implements ModelInterfaceBase {
  final BigInt id; // ID чата
  final UserShort fromUser; // Отправитель
  final int unreadMessagesCount; // Количество непрочитанных сообщений
  final String lastUpdate; // Дата последнего обновления
  Message lastMessage; // Последнее сообщение

  // Конструктор модели
  Dialog({
    required this.id,
    required this.fromUser,
    required this.unreadMessagesCount,
    required this.lastUpdate,
    required this.lastMessage,
  });

  // Функция, преобразующая JSON в объект модели
  factory Dialog.fromJson(Map<String, dynamic> json) {
    return Dialog(
      id: BigInt.from(json['id']),
      fromUser:
          UserShort.fromJson(json['from_user']), // Преобразуем пользователя
      unreadMessagesCount: json['unread_messages_count'],
      lastUpdate: json['last_update'],
      lastMessage:
          Message.fromJson(json['last_message']), // Преобразуем сообщение
    );
  }

  // Функция, преобразующая объект модели обратно в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'from_user': fromUser.toJson(), // Преобразуем обратно пользователя
      'unread_messages_count': unreadMessagesCount,
      'last_update': lastUpdate,
      'last_message': lastMessage.toJson(), // Преобразуем обратно сообщение
    };
  }
}
