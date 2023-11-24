class Exception {
  final String? message;

  const Exception({this.message});
}

class ServerException extends Exception {
  const ServerException({String? message}) : super(message: message);
}

class ClientException extends Exception {
  const ClientException({String? message}) : super(message: message);
}

class DataException extends Exception {
  const DataException({String? message}) : super(message: message);
}

class RequestLimitException extends Exception {
  const RequestLimitException({String? message}) : super(message: message);
}
