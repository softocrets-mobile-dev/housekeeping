import 'package:housekeeping_pro/common/constants/app_messages.dart';

class NetworkException implements Exception {
  NetworkException([this._message, this._prefix]);

  final String? _message;
  final String? _prefix;

  @override
  String toString() {
    return '$_message';
  }
}

class BadRequestException extends NetworkException {
  BadRequestException([message])
      : super(message, AppMessages.txtInvalidRequest);
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException([message])
      : super(message, AppMessages.txtUnauthorised);
}

class ForbiddenException extends NetworkException {
  ForbiddenException([String? message])
      : super(message, AppMessages.txtForbiddenException);
}

class InternalServerErrorException extends NetworkException {
  InternalServerErrorException([String? message])
      : super(message, AppMessages.txtInternalServerException);
}
