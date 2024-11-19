import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:linkyou/core/providers/auth_provider.dart';

class ApiBase {
  static const String baseUrl = 'https://linkyou.ru/api/v2';
  String? bearerToken;
  final AuthProvider authProvider;

  ApiBase({required this.authProvider}) {
    bearerToken = authProvider.token; // Получаем токен из AuthProvider
  }

  Future<http.Response> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: _setHeaders(),
    );

    print(endpoint);

    return _processResponse(response);
  }

  Future<http.Response> post(String endpoint,
      {Map<String, dynamic>? body}) async {
    // Создаем MultipartRequest
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl$endpoint'));

    // Устанавливаем заголовки, если необходимо
    request.headers.addAll(_setHeaders());

    // Добавляем поля из body в request, если body не null
    if (body != null) {
      body.forEach((key, value) {
        // Проверяем тип значения, если оно строка, добавляем как текстовое поле
        if (value is String) {
          request.fields[key] = value;
        } else if (value is int || value is double || value is bool) {
          // Преобразуем примитивы в строку
          request.fields[key] = value.toString();
        } else {
          // Если значение сложного типа, вы можете реализовать дополнительные проверки
          throw Exception('Unsupported value type for form-data');
        }
      });
    }

    // Отправляем запрос
    final streamedResponse = await request.send();

    // Читаем ответ как обычный Response
    final response = await http.Response.fromStream(streamedResponse);

    // Обрабатываем ответ
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

    if (bearerToken != null && bearerToken!.isNotEmpty) {
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
