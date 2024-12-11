import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:linkyou/models/socket_data.dart';
import 'package:linkyou/core/enums/socker_user_status_enum.dart';

class SocketProvider with ChangeNotifier {
  late IO.Socket socket;

  // Callback-функции для событий
  Function(SocketData)? onUserOnline;
  Function(SocketData)? onUserOffline;

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
          SockerUserStatusEnum command = SockerUserStatusEnum.values
              .firstWhere((e) => e.value == socketData.cmd);

          // Обработка события на основе состояния пользователя
          switch (command) {
            case SockerUserStatusEnum.online:
              print('Пользователь онлайн: ${socketData.data}');
              if (onUserOnline != null) {
                onUserOnline!(socketData); // Вызов callback для статуса online
              }
              break;
            case SockerUserStatusEnum.offline:
              print('Пользователь оффлайн: ${socketData.data}');
              if (onUserOffline != null) {
                onUserOffline!(
                    socketData); // Вызов callback для статуса offline
              }
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

  void closeSocket() {
    try {
      socket.disconnect();
      socket.dispose();
    } catch (e) {
      print(e);
    }
  }
}
