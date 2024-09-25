import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://linkyou.ru/api/v2';

  Future<Map<String, dynamic>> postForgotPassword(String email) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/auth/forgot'),
    );
    request.fields['email'] = email;

    var response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      return jsonDecode(responseBody);
    } else {
      final responseBody = await response.stream.bytesToString();
      throw Exception(jsonDecode(responseBody)['message']);
    }
  }

  Future<List<dynamic>> getDailyUsers({
    required int limit,
    required int page,
    int? cityId,
  }) async {
    final queryParameters = {
      'limit': limit.toString(),
      'page': page.toString(),
      if (cityId != null) 'city_id': cityId.toString(),
    };

    final uri = Uri.parse('$baseUrl/users/daily')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: _buildHeaders(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Не удалось загрузить пользователей: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> getCities() async {
    final response = await http.get(
      Uri.parse('$baseUrl/lists/cities'),
      headers: _buildHeaders(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load cities');
    }
  }

  Future<List<dynamic>> getNewUsers() async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/new'),
      headers: _buildHeaders(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load new users');
    }
  }

  Future<List<dynamic>> getTopUsers({
    required String type,
    required int page,
  }) async {
    final queryParameters = {
      'page': page.toString(),
      'type': type,
      'limit': '10',
    };

    final uri = Uri.parse('$baseUrl/users/top')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: _buildHeaders(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Не удалось загрузить топ пользователей');
    }
  }

  Future<Map<String, dynamic>> getUserDetails(int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/$userId'),
      headers: _buildHeaders(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user details');
    }
  }

  Future<Map<String, dynamic>> getUserPhotos(int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/photos/$userId'),
      headers: _buildHeaders(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user details');
    }
  }

  Future<Map<String, dynamic>> getUserUblogs(int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/ublogs/$userId'),
      headers: _buildHeaders(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user details');
    }
  }

  Future<Map<String, dynamic>> signIn(String login, String password) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/auth/signin'),
    );

    request.fields['login'] = login;
    request.fields['password'] = password;

    var response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      return jsonDecode(responseBody);
    } else {
      final responseBody = await response.stream.bytesToString();
      throw Exception(jsonDecode(responseBody)['message']);
    }
  }

  Map<String, String> _buildHeaders() {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    // Получаем токен из AuthProvider
    const token = 'LzuaDweazYN8KTbWCn9lCrYxrfW-H0AI';
    headers['Authorization'] = 'Bearer $token';

    return headers;
  }
}
