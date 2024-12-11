import 'package:dio/dio.dart';
import 'package:linkyou/core/providers/auth_provider.dart';

class ApiBase {
  static const String baseUrl = 'https://linkyou.ru/api/v2';

  final Dio dio;
  final AuthProvider authProvider;
  
  bool isDebug = false;

  ApiBase({required this.authProvider})
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          contentType: Headers.jsonContentType,
        )) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _addAuthorizationHeader(options);
          _logRequest(options);
          return handler.next(options);
        },
        onResponse: (response, handler) {
          _logResponse(response);
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          _logError(e);
          return handler.next(e);
        },
      ),
    );
  }

  void _addAuthorizationHeader(RequestOptions options) {
    if (authProvider.token != null && authProvider.token!.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer ${authProvider.token}';
    } else {
      options.headers
          .remove('Authorization');
    }
  }

  void _logRequest(RequestOptions options) {
    if (isDebug) {
      print("Запрос: ${options.method} ${options.path}");
      print("Параметры: ${options.queryParameters}");
      print("Данные: ${options.data}");
      print("Заголовки: ${options.headers}");
    }
  }

  void _logResponse(Response response) {
    if (isDebug) {
      print("Ответ: ${response.statusCode} ${response.data}");
    }
  }

  void _logError(DioException e) {
    if (isDebug) {
      print("Ошибка: ${e.message}");
    }
  }

  Future<Response> get(String endpoint) async {
    return _requestWithHandling(() => dio.get(endpoint));
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? body}) async {
    return _requestWithHandling(
        () => dio.post(endpoint, data: FormData.fromMap(body ?? {})));
  }

  Future<Response> put(String endpoint, {Map<String, dynamic>? body}) async {
    return _requestWithHandling(
        () => dio.put(endpoint, data: FormData.fromMap(body ?? {})));
  }

  Future<Response> delete(String endpoint) async {
    return _requestWithHandling(() => dio.delete(endpoint));
  }

  Future<Response> _requestWithHandling(
      Future<Response> Function() requestFunction) async {
    try {
      final response = await requestFunction();
      return _processResponse(response);
    } on DioException catch (e) {
      throw Exception('Ошибка при выполнении запроса: $e');
    }
  }

  Response _processResponse(Response response) {
    if (response.statusCode! < 200 || response.statusCode! >= 300) {
      throw Exception('Error: ${response.statusCode} ${response.data}');
    }
    return response;
  }
}
