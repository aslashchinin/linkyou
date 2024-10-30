import 'package:flutter/material.dart';
import 'package:linkyou/core/models/login.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:linkyou/core/models/user.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = true;
  User? _user;
  String? _token;

  User? get user => _user;
  String? get token => _token;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;

  AuthProvider() {
    print('Load Auth Provider');
    loadFromPrefs();
  }

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    
    _isLoading = false;

    if (prefs.getString('token') == null || prefs.getString('user') == null) {
      notifyListeners();
      return;
    }

    _token = prefs.getString('token');
    _user = User.fromJson(jsonDecode(prefs.getString('user') ?? '{}'));
    

    if (_token != null && _user != null) {
      _isAuthenticated = true;
    }

    notifyListeners();
  }

  Future<void> login(Login request) async {
    _isAuthenticated = true;
    
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('token', request.token);
      prefs.setString('user', jsonEncode(request.user));
    });

    _token = request.token;
    _user = request.user;

    notifyListeners(); // Уведомление об изменениях
  }

  void logout() {
    _isAuthenticated = false;
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove('token');
      prefs.remove('user');
    });
    _token = null;
    _user = null;
    notifyListeners(); // Уведомление об изменениях
  }
}