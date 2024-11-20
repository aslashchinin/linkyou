class ServiceResponse<T> {
  final T data;
  final Map<String, List<String>> headers;

  ServiceResponse({required this.data, required this.headers});
}
