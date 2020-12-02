abstract class Failure implements Exception {
  String get message;
}

class ResponseError extends Failure {
  final String message;
  ResponseError({this.message});
}

class ConnectionNetWorkingError extends Failure {
  final String message;
  ConnectionNetWorkingError({this.message});
}