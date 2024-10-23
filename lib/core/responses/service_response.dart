class ServiceResponse<T> {
  final T data;
  final Map<String, String> headers;

  ServiceResponse({required this.data, required this.headers});
}
