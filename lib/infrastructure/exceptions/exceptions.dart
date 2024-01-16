class ServerException implements Exception {
  final String message;

  ServerException({this.message = 'A server error occurred'});

  @override
  String toString() {
    return 'ServerException: $message';
  }
}
