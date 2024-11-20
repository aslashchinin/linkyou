import 'package:dio/dio.dart';
import 'package:linkyou/core/providers/auth_provider.dart';

class ApiBase {
  static const String baseUrl = 'https://linkyou.ru/api/v2';
  String? bearerToken;
  final Dio dio;
  final AuthProvider authProvider;

  ApiBase({required this.authProvider})
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          contentType: Headers.jsonContentType,
        )) {
    bearerToken = authProvider.token;

    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, ErrorInterceptorHandler handler) {
        print('Ошибка: ${e.response?.statusCode} - ${e.message}');
        handler.next(e);
      },
    ));

    // Устанавливаем общий заголовок Authorization
    dio.options.headers['Authorization'] = 'Bearer $bearerToken';
  }

  Future<Response> get(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      print('GET $endpoint');
      return _processResponse(response);
    } on DioException catch (e) {
      throw Exception('Ошибка при выполнении GET: $e');
    }
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final response = await dio.post(endpoint, data: body);
      print('POST $endpoint');
      return _processResponse(response);
    } on DioException catch (e) {
      throw Exception('Ошибка при выполнении POST: $e');
    }
  }

  Future<Response> put(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final response = await dio.put(endpoint, data: body);
      print('PUT $endpoint');
      return _processResponse(response);
    } on DioException catch (e) {
      throw Exception('Ошибка при выполнении PUT: $e');
    }
  }

  Future<Response> delete(String endpoint) async {
    try {
      final response = await dio.delete(endpoint);
      print('DELETE $endpoint');
      return _processResponse(response);
    } on DioException catch (e) {
      throw Exception('Ошибка при выполнении DELETE: $e');
    }
  }

  Response _processResponse(Response response) {
    if (response.statusCode! < 200 || response.statusCode! >= 300) {
      throw Exception('Error: ${response.statusCode} ${response.data}');
    }
    return response;
  }
}
