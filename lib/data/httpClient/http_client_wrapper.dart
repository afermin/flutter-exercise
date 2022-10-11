import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nubank_exercise/data/httpClient/http_error_converter.dart';
import 'package:nubank_exercise/domain/models/failure.dart';

@Injectable()
class HttpClientWrapper {
  HttpClientWrapper(this._client, this._errorConverter);

  final Dio _client;
  final HttpErrorConverter _errorConverter;

  Future<Either<Failure, T>> get<T>(
    String path, {
    Map<String, String>? queryParams,
  }) async {
    try {
      final Response<T> response = await _client.get(
        path,
        queryParameters: queryParams,
      );
      return right(response.data as T);
    } on DioError catch (error) {
      return left(_errorConverter.mapError(error));
    }
  }

  Future<Either<Failure, T>> post<T>(
    String path, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final Response<T> response = await _client.post(
        path,
        data: body,
        queryParameters: queryParams,
      );
      return right(response.data as T);
    } on DioError catch (error) {
      return left(_errorConverter.mapError(error));
    }
  }
}
