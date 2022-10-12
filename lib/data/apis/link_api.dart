import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nubank_exercise/data/http_client/http_client_wrapper.dart';
import 'package:nubank_exercise/data/models/shorten_link_response.dart';
import 'package:nubank_exercise/domain/models/failure.dart';

abstract class LinkApi {
  Future<Either<Failure, ShortenLinkResponse>> shortenLink(String link);
}

@Injectable(as: LinkApi)
class LinkApiImpl implements LinkApi {
  LinkApiImpl(this._httpClientWrapper);

  final HttpClientWrapper _httpClientWrapper;

  @override
  Future<Either<Failure, ShortenLinkResponse>> shortenLink(String link) async {
    final Map<String, String> params = {'url': link};

    final response = await _httpClientWrapper.post('/api/alias', body: params);

    try {
      return response.map((dynamic) => ShortenLinkResponse.fromJson(dynamic));
    } catch (e) {
      return left(const MappingFailure());
    }
  }
}
