import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_exercise/data/http_client/http_error_converter.dart';
import 'package:nubank_exercise/domain/models/failure.dart';

void main() {
  final HttpErrorConverter httpErrorConverter = HttpErrorConverter();

  group("mapError method scenarios", () {
    DioError getDioError(DioErrorType type, {int statusCode = 0}) {
      final requestOptions = RequestOptions(path: "path");
      return DioError(
        type: type,
        response: Response(
          statusCode: statusCode,
          requestOptions: requestOptions,
        ),
        requestOptions: requestOptions,
      );
    }

    test(
        "Given a $HttpErrorConverter"
        "When $HttpErrorConverter mapError method is called with a $DioError"
        "with a type ${DioErrorType.sendTimeout}"
        "Then $HttpErrorConverter mapError method should return a "
        "$TimeOutFailure", () {
      final dioError = getDioError(DioErrorType.sendTimeout);
      final response = httpErrorConverter.mapError(dioError);

      expect(response, isA<TimeOutFailure>());
    });

    test(
        "Given a $HttpErrorConverter"
        "When $HttpErrorConverter mapError method is called with a $DioError"
        "with a type ${DioErrorType.connectTimeout}"
        "Then $HttpErrorConverter mapError method should return a "
        "$TimeOutFailure", () {
      final dioError = getDioError(DioErrorType.connectTimeout);
      final response = httpErrorConverter.mapError(dioError);

      expect(response, isA<TimeOutFailure>());
    });

    test(
        "Given a $HttpErrorConverter"
        "When $HttpErrorConverter mapError method is called with a $DioError"
        "with a type ${DioErrorType.receiveTimeout}"
        "Then $HttpErrorConverter mapError method should return a "
        "$TimeOutFailure", () {
      final dioError = getDioError(DioErrorType.receiveTimeout);
      final response = httpErrorConverter.mapError(dioError);

      expect(response, isA<TimeOutFailure>());
    });

    test(
        "Given a $HttpErrorConverter"
        "When $HttpErrorConverter mapError method is called with a $DioError"
        "with a type ${DioErrorType.response} with an statusCode 400"
        "Then $HttpErrorConverter mapError method should return a "
        "$BadRequestFailure", () {
      final dioError = getDioError(DioErrorType.response, statusCode: 400);
      final response = httpErrorConverter.mapError(dioError);

      expect(response, isA<BadRequestFailure>());
    });

    test(
        "Given a $HttpErrorConverter"
        "When $HttpErrorConverter mapError method is called with a $DioError"
        "with a type ${DioErrorType.response} with an statusCode 404"
        "Then $HttpErrorConverter mapError method should return a "
        "$ResourceNotFoundFailure", () {
      final dioError = getDioError(DioErrorType.response, statusCode: 404);
      final response = httpErrorConverter.mapError(dioError);

      expect(response, isA<ResourceNotFoundFailure>());
    });

    test(
        "Given a $HttpErrorConverter"
        "When $HttpErrorConverter mapError method is called with a $DioError"
        "with a type ${DioErrorType.response} with an statusCode different "
        "to 400 and 404"
        "Then $HttpErrorConverter mapError method should return a "
        "$UnknownFailure", () {
      final dioError = getDioError(DioErrorType.response, statusCode: 300);
      final response = httpErrorConverter.mapError(dioError);

      expect(response, isA<UnknownFailure>());
    });

    test(
        "Given a $HttpErrorConverter"
        "When $HttpErrorConverter mapError method is called with a $DioError"
        "with a type ${DioErrorType.cancel}"
        "Then $HttpErrorConverter mapError method should return a "
        "$UnknownFailure", () {
      final dioError = getDioError(DioErrorType.cancel);
      final response = httpErrorConverter.mapError(dioError);

      expect(response, isA<UnknownFailure>());
    });

    test(
        "Given a $HttpErrorConverter"
        "When $HttpErrorConverter mapError method is called with a $DioError"
        "with a type ${DioErrorType.other}"
        "Then $HttpErrorConverter mapError method should return a Failure", () {
      final dioError = getDioError(DioErrorType.other);
      final response = httpErrorConverter.mapError(dioError);

      expect(response, isA<Failure>());
    });
  });
}
