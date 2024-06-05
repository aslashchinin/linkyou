import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../services/api_services.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  Map<String, dynamic>? _user;

  String? get token => _token;
  Map<String, dynamic>? get user => _user;

  AuthProvider() {
    loadFromPrefs();
  }

  Future<void> signIn(String login, String password) async {
    final apiService = ApiService();
    final response = await apiService.signIn(login, password);

    _token = response['token'];
    _user = response['user'];

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', _token!);
    await prefs.setString('user', jsonEncode(_user));

    notifyListeners();
  }

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    _user = jsonDecode(prefs.getString('user') ?? '{}');

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
