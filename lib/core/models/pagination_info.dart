class PaginationInfo {
  final int currentPage;
  final bool isEnd;
  final int limit;
  final int total;

  PaginationInfo({
    required this.currentPage,
    required this.isEnd,
    required this.limit,
    required this.total,
  });

  factory PaginationInfo.fromHeaders(Map<String, List<String>> headers) {
    return PaginationInfo(
      currentPage: int.parse(headers['x-pagination-current']?[0] ?? '1'),
      isEnd: headers['x-pagination-is-end']?[0] == '1',
      limit: int.parse(headers['x-pagination-limit']?[0] ?? '24'),
      total: int.parse(headers['x-pagination-total']?[0] ?? '0'),
    );
  }
}
