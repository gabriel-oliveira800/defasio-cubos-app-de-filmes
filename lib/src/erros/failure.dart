abstract class Failure implements Exception {
  String get message;
}

class ConnectionNetWorkingError extends Failure {
  final String message;
  ConnectionNetWorkingError({this.message});
}