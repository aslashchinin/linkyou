import 'package:flutter/material.dart';
import 'package:linkyou/core/services/user_status_service.dart';

class UserStatusProvider extends ChangeNotifier {
  final UserStatusService _statusService;

  UserStatusProvider(this._statusService);

  Stream<Map<BigInt, bool>> get statusStream => _statusService.statusStream;

  void updateUserStatus(BigInt userId, bool isOnline) {
    _statusService.updateUserStatus(userId, isOnline);
    notifyListeners();
  }

  bool isUserOnline(BigInt userId) {
    return _statusService.isUserOnline(userId);
  }
}
