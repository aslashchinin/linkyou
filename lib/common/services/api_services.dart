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

  Future<List<dynamic>> getDailyUsers(int limit, int page,
      {int? cityId}) async {
    String url = '$baseUrl/users/daily?limit=$limit&page=$page';
    if (cityId != null) {
      url += '&city_id=$cityId';
    }
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<dynamic>> getCities() async {
    final response = await http.get(Uri.parse('$baseUrl/lists/cities'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load cities');
    }
  }

  Future<List<dynamic>> getNewUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users/new'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load new users');
    }
  }

  Future<List<dynamic>> getTopUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users/top'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load top users');
    }
  }

  Future<Map<String, dynamic>> getUserDetails(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$userId'));

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
}
