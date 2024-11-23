class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => 'ApiException: $message';
}

class ConnectionException extends ApiException {
  ConnectionException(super.message);
}

class BadResponseException extends ApiException {
  BadResponseException(super.message);
}

class UnknownApiException extends ApiException {
  UnknownApiException(super.message);
}
