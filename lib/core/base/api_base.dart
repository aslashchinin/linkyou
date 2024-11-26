import 'package:dio/dio.dart';
import 'package:linkyou/core/providers/auth_provider.dart';

class ApiBase {
  static const String baseUrl = 'https://linkyou.ru/api/v2';

  final Dio dio;
  final AuthProvider authProvider;

  ApiBase({required this.authProvider})
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          contentType: Headers.jsonContentType,
        )) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("Запрос: ${options.method} ${options.path}");
          print("Параметры: ${options.queryParameters}");
          print("Данные: ${options.data}");
          print("Заголовки: ${options.headers}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("Ответ: ${response.statusCode} ${response.data}");
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          print("Ошибка: ${e.message}");
          return handler.next(e);
        },
      ),
    );

    if (authProvider.token != null && authProvider.token!.isNotEmpty) {
      print('Bearer token: ${authProvider.token}');
      dio.options.headers['Authorization'] = 'Bearer ${authProvider.token}';
    }
  }

  Future<Response> get(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return _processResponse(response);
    } on DioException catch (e) {
      print(dio.options.headers);
      throw Exception('Ошибка при выполнении GET: $e');
    }
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final response =
          await dio.post(endpoint, data: FormData.fromMap(body ?? {}));
      return _processResponse(response);
    } on DioException catch (e) {
      print(dio.options.headers);
      throw Exception('Ошибка при выполнении POST: $e');
    }
  }

  Future<Response> put(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final response =
          await dio.put(endpoint, data: FormData.fromMap(body ?? {}));
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
