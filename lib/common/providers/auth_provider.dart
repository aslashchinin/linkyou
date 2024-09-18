import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:linkyou/common/services/api_services.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = true; // Переменная для отслеживания загрузки

  String? _token;
  Map<String, dynamic>? _user;

  String? get token => _token;
  Map<String, dynamic>? get user => _user;
  bool get isLoading => _isLoading;

  AuthProvider() {
    print('Load Auth Provider');
    loadFromPrefs();
  }

  Future<void> signIn(String token, Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', _token!);
    await prefs.setString('user', jsonEncode(_user));

    notifyListeners();
  }

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    _token = prefs.getString('token');
    _user = jsonDecode(prefs.getString('user') ?? '{}');
    _isLoading = false;

    if (_token != null && _user != null && _user!.isNotEmpty) {
      notifyListeners();
    }
  }

  void setUser(Map<String, dynamic> user) {
    _user = user;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;

    notifyListeners();
  }

  void signOut() async {
    _token = null;
    _user = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('user');

    notifyListeners();
  }
}
