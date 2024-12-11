import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:linkyou/models/socket_data.dart';
import 'package:linkyou/core/enums/socket_packet_enum.dart';
import 'package:linkyou/models/socket_new_message.dart';

class SocketProvider with ChangeNotifier {
  late IO.Socket socket;
  
  // Список колбэков для каждого события
  final List<void Function(SocketData)> onUserOnlineCallbacks = [];
  final List<void Function(SocketData)> onUserOfflineCallbacks = [];
  final List<void Function(SocketNewMessage)> onNewMessageCallbacks = [];
  final List<void Function(SocketData)> onNewVisitCallbacks = [];

  void init(String? token) {
    try {
      socket = IO.io(
        'wss://socket.linkyou.ru/',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .setReconnectionAttempts(5)
            .setReconnectionDelay(1000)
            .build(),
      );

      socket.onConnect((_) {
        print('Подключено к серверу');
        if (token != null) {
          socket.emit('handshake', token);
        }
        notifyListeners();
      });

      socket.on('packet', (data) {
        try {
          SocketData socketData = SocketData.fromJson(data);
          SocketPacketEnum command = SocketPacketEnum.values
              .firstWhere((e) => e.value == socketData.cmd);

          // Обработка события на основе состояния пользователя
          switch (command) {
            case SocketPacketEnum.userOnline:
              print('Пользователь онлайн: ${socketData.data}');
              for (var callback in onUserOnlineCallbacks) {
                callback(socketData);
              }
              break;

            case SocketPacketEnum.userOffline:
              print('Пользователь оффлайн: ${socketData.data}');
              for (var callback in onUserOfflineCallbacks) {
                callback(socketData);
              }
              break;

            case SocketPacketEnum.newMessage:
              print('Новое сообщение: ${socketData.data}');
              SocketNewMessage newMessage =
                  SocketNewMessage.fromJson(socketData.data);
              for (var callback in onNewMessageCallbacks) {
                callback(newMessage);
              }
              break;

            case SocketPacketEnum.newVisit:
              print('Новый визит: ${socketData.data}');
              for (var callback in onNewVisitCallbacks) {
                callback(socketData);
              }
              break;

            default:
              print('Неизвестная команда: ${socketData.cmd}');
              break;
          }
        } catch (e) {
          print(e);
        } finally {
          notifyListeners();
        }
      });

      socket.onDisconnect((_) => print('Отключено от сервера'));
      socket.onConnectError((data) {
        print('Ошибка подключения: $data');
      });
      socket.onError((data) {
        print('Ошибка: $data');
      });

      socket.connect();
    } catch (e) {
      print(e);
    }
  }

  void subscribeToUserOnline(void Function(SocketData) callback) {
    onUserOnlineCallbacks.add(callback);
  }

  void subscribeToUserOffline(void Function(SocketData) callback) {
    onUserOfflineCallbacks.add(callback);
  }

  void subscribeToNewMessage(void Function(SocketNewMessage) callback) {
    onNewMessageCallbacks.add(callback);
  }

  void subscribeToNewVisit(void Function(SocketData) callback) {
    onNewVisitCallbacks.add(callback);
  }

  void unsubscribeFromUserOnline(void Function(SocketData) callback) {
    onUserOnlineCallbacks.remove(callback);
  }

  void unsubscribeFromUserOffline(void Function(SocketData) callback) {
    onUserOfflineCallbacks.remove(callback);
  }

  void unsubscribeFromNewMessage(void Function(SocketNewMessage) callback) {
    onNewMessageCallbacks.remove(callback);
  }

  void unsubscribeFromNewVisit(void Function(SocketData) callback) {
    onNewVisitCallbacks.remove(callback);
  }

  void closeSocket() {
    try {
      socket.disconnect();
      socket.dispose();
    } catch (e) {
      print(e);
    }
  }
}
