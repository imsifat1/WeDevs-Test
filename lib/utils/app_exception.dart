class AppException implements Exception {

  String? message;
  AppException({this.message});
}

class NoInternetException extends AppException {
  NoInternetException({message}) : super(message: message);
}

class BadConnectionException extends AppException {
  BadConnectionException({message}) : super(message: message);
}

class BadRequestException extends AppException {
  BadRequestException({message}) : super(message: message);
}

class ConnectionTimedOutException extends AppException {
  ConnectionTimedOutException({message}) : super(message: message);
}
