import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nubank_exercise/domain/models/failure.dart';

@injectable
class HttpErrorConverter {
  /// Return a Failure from a DioError
  Failure mapError<T>(DioError error) {
    switch (error.type) {
      // Ideally there should be different types of Failure's type classes
      case DioErrorType.cancel:
      case DioErrorType.sendTimeout:
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.response:
        return Failure(message: error.message);
      default:
        return Failure(message: error.message);
    }
  }
}
