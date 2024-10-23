import 'package:linkyou/core/models/pagination_info.dart';

class RepositoryResponse<T> {
  final T data;
  final PaginationInfo pagination;

  RepositoryResponse({required this.data, required this.pagination});
}
