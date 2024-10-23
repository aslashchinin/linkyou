import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiBase {
  static const String baseUrl = 'https://linkyou.ru/api/v2';
  String? bearerToken;

  ApiBase({this.bearerToken});

  Future<http.Response> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: _setHeaders(),
    );

    return _processResponse(response);
  }

  Future<http.Response> post(String endpoint,
      {Map<String, dynamic>? body}) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: _setHeaders(),
      body: jsonEncode(body),
    );
    return _processResponse(response);
  }

  Future<http.Response> put(String endpoint,
      {Map<String, dynamic>? body}) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: _setHeaders(),
      body: jsonEncode(body),
    );
    return _processResponse(response);
  }

  Future<http.Response> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: _setHeaders(),
    );
    return _processResponse(response);
  }

  Map<String, String> _setHeaders() {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    if (bearerToken != null) {
      headers['Authorization'] = 'Bearer $bearerToken';
    }
    return headers;
  }

  http.Response _processResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Error: ${response.statusCode} ${response.body}');
    }
    return response;
  }
}
