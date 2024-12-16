import "dart:async";

class UserStatusService {
  final _userStatusController = StreamController<Map<BigInt, bool>>.broadcast();
  final Map<BigInt, bool> _userStatuses = {};

  // Добавим логирование последнего обновления
  final Map<BigInt, DateTime> _lastUpdateTime = {};

  Stream<Map<BigInt, bool>> get statusStream => _userStatusController.stream;

  void updateUserStatus(BigInt userId, bool isOnline) {
    final now = DateTime.now();

    // Обновляем время последнего изменения
    _lastUpdateTime[userId] = now;

    // Обновляем статус
    _userStatuses[userId] = isOnline;
    _userStatusController.add(_userStatuses);

    // Логирование для отладки
    print(
        'Статус пользователя $userId обновлен: ${isOnline ? "онлайн" : "оффлайн"}');
  }

  bool isUserOnline(BigInt userId) {
    return _userStatuses[userId] ?? false;
  }

  void dispose() {
    _userStatusController.close();
  }

  // Получение времени последнего обновления
  DateTime? getLastUpdateTime(BigInt userId) {
    return _lastUpdateTime[userId];
  }

  // Очистка статуса при выходе пользователя
  void clearUserStatus(BigInt userId) {
    _userStatuses.remove(userId);
    _lastUpdateTime.remove(userId);
    _userStatusController.add(_userStatuses);
  }
}
