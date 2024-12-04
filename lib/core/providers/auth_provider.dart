import 'package:flutter/material.dart';
import 'package:linkyou/core/models/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:linkyou/core/models/user.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider() {
    _loadFromPrefs();
  }

  bool _isAuthenticated = false;
  bool _isLoading = true;
  User? _user;
  String? _token;

  User? get user => _user;
  String? get token => _token;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;

  set token(String? value) {
    _token = value;
    notifyListeners();
  }

  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }

  /// Load authentication data from shared preferences
  Future<void> _loadFromPrefs() async {
    final prefs = await _getSharedPreferences();
    _isLoading = false;

    final savedToken = prefs.getString('token');

    if (savedToken == null) {
      notifyListeners();
      return;
    }

    try {
      _token = savedToken;
    } catch (e) {
      logout();
    } finally {
      _isAuthenticated = (_token != null && _user != null);
      notifyListeners();
    }
  }

  /// Login the user and save token and user to shared preferences
  Future<void> login(Login request) async {
    _isAuthenticated = true;
    token = request.token;
    user = request.user;

    try {
      final prefs = await _getSharedPreferences();
      await prefs.setString('token', token ?? '');
    } catch (e, stackTrace) {
      print('Ошибка: $e');
      print('Стек вызовов: $stackTrace');
      logout();
    } finally {
      notifyListeners();
    }
  }

  /// Logout the user and clear stored preferences
  void logout() {
    _isAuthenticated = false;

    token = null;
    user = null;

    _getSharedPreferences().then((prefs) async {
      await prefs.remove('token');
    });

    notifyListeners();
  }

  Future<SharedPreferences> _getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }
}
