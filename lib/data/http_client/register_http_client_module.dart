import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterHttpClientModule {
  @Named("BaseUrl")
  String get baseUrl => 'https://url-shortener-nu.herokuapp.com';

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));
}
