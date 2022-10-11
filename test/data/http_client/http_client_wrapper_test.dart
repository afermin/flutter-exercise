import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_exercise/data/http_client/http_client_wrapper.dart';
import 'package:nubank_exercise/data/http_client/http_error_converter.dart';
import 'package:nubank_exercise/domain/models/failure.dart';

import 'http_client_wrapper_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>(), MockSpec<HttpErrorConverter>()])
void main() {
  final Dio dio = MockDio();
  final HttpErrorConverter httpErrorConverter = MockHttpErrorConverter();

  final HttpClientWrapper httpClientWrapper =
      HttpClientWrapper(dio, httpErrorConverter);

  group("Get method scenarios", () {
    test(
        "Given a $HttpClientWrapper and a $Dio"
        "When $HttpClientWrapper get method is called and $Dio "
        "get method returns a ${Response<Map<String, dynamic>>}"
        "Then $HttpClientWrapper get method should call $Dio "
        "get method once and return a right(${Map<String, dynamic>})",
        () async {
      const Map<String, dynamic> body = <String, dynamic>{};
      const String path = 'path';
      final mapResponse = <String, dynamic>{"company": "Nubank"};
      final dioResponse = Response(
        data: mapResponse,
        requestOptions: RequestOptions(
          path: path,
        ),
      );
      when(dio.get(path, queryParameters: body))
          .thenAnswer((_) => Future.value(dioResponse));

      (await httpClientWrapper.get(path, queryParams: body)).fold(
        (l) => null,
        (response) {
          expect(response, mapResponse);
        },
      );

      verify(dio.get(path, queryParameters: body)).called(1);
    });

    test(
        "Given a $HttpClientWrapper and a $Dio"
        "When $HttpClientWrapper get method is called and $Dio "
        "get method throws a $DioError"
        "Then $HttpClientWrapper get method should call $Dio "
        "get method once and return a left($Failure)", () async {
      const Map<String, dynamic> body = <String, dynamic>{};
      const String path = 'path';
      const Failure failure = Failure(message: "Failure message");
      final dioError = DioError(
        type: DioErrorType.sendTimeout,
        requestOptions: RequestOptions(
          path: path,
        ),
      );
      when(httpErrorConverter.mapError(dioError)).thenAnswer((_) => failure);
      when(dio.get(path, queryParameters: body)).thenThrow(dioError);

      final response = (await httpClientWrapper.get(path, queryParams: body));

      expect(response, left(failure));
      verify(dio.get(path, queryParameters: body)).called(1);
    });
  });

  group("Post method scenarios", () {
    test(
        "Given a $HttpClientWrapper and a $Dio"
        "When $HttpClientWrapper post method is called and $Dio "
        "post method returns a ${Response<Map<String, dynamic>>}"
        "Then $HttpClientWrapper post method should call $Dio "
        "post method once and return a right(${Map<String, dynamic>})",
        () async {
      const Map<String, dynamic> body = <String, dynamic>{};
      const String path = 'path';
      final mapResponse = <String, dynamic>{"company": "Nubank"};
      final dioResponse = Response(
        data: mapResponse,
        requestOptions: RequestOptions(
          path: path,
        ),
      );
      when(dio.post(path, data: body))
          .thenAnswer((_) => Future.value(dioResponse));

      (await httpClientWrapper.post(path, body: body)).fold(
        (l) => null,
        (response) {
          expect(response, mapResponse);
        },
      );

      verify(dio.post(path, data: body)).called(1);
    });

    test(
        "Given a $HttpClientWrapper and a $Dio"
        "When $HttpClientWrapper post method is called and $Dio "
        "post method throws a $DioError"
        "Then $HttpClientWrapper post method should call $Dio "
        "post method once and return a left($Failure)", () async {
      const Map<String, dynamic> body = <String, dynamic>{};
      const String path = 'path';
      const Failure failure = Failure(message: "Failure message");
      final dioError = DioError(
        type: DioErrorType.sendTimeout,
        requestOptions: RequestOptions(
          path: path,
        ),
      );
      when(httpErrorConverter.mapError(dioError)).thenAnswer((_) => failure);
      when(dio.post(path, data: body)).thenThrow(dioError);

      final response = (await httpClientWrapper.post(path, body: body));

      expect(response, left(failure));
      verify(dio.post(path, data: body)).called(1);
    });
  });
}
