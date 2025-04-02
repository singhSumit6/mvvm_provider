class AppExceptions implements Exception {
  final String prefix;
  final String message;

  AppExceptions({required this.prefix, this.message = ''});

  @override
  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String message = ''])
      : super(prefix: 'Error During Communication.', message: message);
}

class BadRequestException extends AppExceptions {
  BadRequestException([String message = ''])
      : super(prefix: 'Invalid Request.', message: message);
}

class UnatuhorisedException extends AppExceptions {
  UnatuhorisedException([String message = ''])
      : super(prefix: 'Unauthorised Request.', message: message);
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String message = ''])
      : super(prefix: 'Invalid Input.', message: message);
}

class NoInternetException extends AppExceptions {
  NoInternetException([String message = ''])
      : super(prefix: 'No Internet Connection.', message: message);
}
