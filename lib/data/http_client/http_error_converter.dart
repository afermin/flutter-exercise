import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nubank_exercise/domain/models/failure.dart';

@injectable
class HttpErrorConverter {
  /// Return a Failure from a DioError
  Failure mapError<T>(DioError error) {
    final message = error.message;
    // Ideally there should be more types of Failure's type classes
    switch (error.type) {
      case DioErrorType.sendTimeout:
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
        return TimeOutFailure(message: message);
      case DioErrorType.response:
        final statusCode = error.response?.statusCode;
        switch (statusCode) {
          case 400:
            return BadRequestFailure(message: message);
          case 404:
            return ResourceNotFoundFailure(message: message);
          default:
            return UnknownFailure(message: message);
        }
      case DioErrorType.cancel:
      default:
        return UnknownFailure(message: error.message);
    }
  }
}
