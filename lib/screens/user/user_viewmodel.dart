import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user.dart';
import 'package:linkyou/data/user/user_repository_interface.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel({required this.repository});

  final UserRepositoryInterface repository;
  
  User? _user;
  User? get user => _user;

  Future<void> loadUser(BigInt id) async {
    final response = await repository.getUser(id);
    _user = response.data;
    
    notifyListeners();
  }

  void resetUser() {
    _user = null;
    notifyListeners();
  }
}
