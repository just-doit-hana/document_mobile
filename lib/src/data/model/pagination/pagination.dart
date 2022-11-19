class Pagination {
  int? totalCount;
  int? maxPageSize;
  int? currentPage;
  int? totalPages;
  bool? hasNext;
  bool? hasPrevious;
  Pagination({
    this.totalCount,
    this.maxPageSize,
    this.currentPage,
    this.totalPages,
    this.hasNext = false,
    this.hasPrevious = false,
  });

  Pagination.fromMap(Map<String, dynamic> map) {
    totalCount = map['totalCount'];
    maxPageSize = map['maxPageSize'];
    currentPage = map['currentPage'];
    totalPages = map['totalPages'];
    hasNext = map['hasNext'];
    hasPrevious = map['hasPrevious'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalCount': totalCount,
      'maxPageSize': maxPageSize,
      'currentPage': currentPage,
      'totalPages': totalPages,
      'hasNext': hasNext,
      'hasPrevious': hasPrevious,
    };
  }
}
