import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_exercise/data/http_client/http_error_converter.dart';
import 'package:nubank_exercise/domain/models/failure.dart';

void main() {
  final HttpErrorConverter httpErrorConverter = HttpErrorConverter();

  group("mapError method scenarios", () {
    DioError getDioError(DioErrorType type) {
      return DioError(
        type: type,
        requestOptions: RequestOptions(
          path: "path",
        ),
      );
    }

    test(
        "Given a $HttpErrorConverter"
        "When $HttpErrorConverter mapError method is called with a $DioError"
        "with a type ${DioErrorType.sendTimeout}"
        "Then $HttpErrorConverter mapError method should return a Failure", () {
      final dioError = getDioError(DioErrorType.sendTimeout);
      final response = httpErrorConverter.mapError(dioError);

      expect(response, isA<Failure>());
    });

    test(
        "Given a $HttpErrorConverter"
        "When $HttpErrorConverter mapError method is called with a $DioError"
        "with a type ${DioErrorType.connectTimeout}"
        "Then $HttpErrorConverter mapError method should return a Failure", () {
      final dioError = getDioError(DioErrorType.connectTimeout);
      final response = httpErrorConverter.mapError(dioError);

      expect(response, isA<Failure>());
    });

    test(
        "Given a $HttpErrorConverter"
        "When $HttpErrorConverter mapError method is called with a $DioError"
        "with a type ${DioErrorType.receiveTimeout}"
        "Then $HttpErrorConverter mapError method should return a Failure", () {
      final dioError = getDioError(DioErrorType.receiveTimeout);
      final response = httpErrorConverter.mapError(dioError);

      expect(response, isA<Failure>());
    });

    test(
        "Given a $HttpErrorConverter"
        "When $HttpErrorConverter mapError method is called with a $DioError"
        "with a type ${DioErrorType.response}"
        "Then $HttpErrorConverter mapError method should return a Failure", () {
      final dioError = getDioError(DioErrorType.response);
      final response = httpErrorConverter.mapError(dioError);

      expect(response, isA<Failure>());
    });

    test(
        "Given a $HttpErrorConverter"
        "When $HttpErrorConverter mapError method is called with a $DioError"
        "with a type ${DioErrorType.cancel}"
        "Then $HttpErrorConverter mapError method should return a Failure", () {
      final dioError = getDioError(DioErrorType.cancel);
      final response = httpErrorConverter.mapError(dioError);

      expect(response, isA<Failure>());
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
