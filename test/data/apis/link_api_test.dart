import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_exercise/data/apis/link_api.dart';
import 'package:nubank_exercise/data/http_client/http_client_wrapper.dart';
import 'package:nubank_exercise/data/models/shorten_link_response.dart';
import 'package:nubank_exercise/domain/models/failure.dart';

import 'link_api_test.mocks.dart';

@GenerateNiceMocks([MockSpec<HttpClientWrapper>()])
void main() {
  final HttpClientWrapper clientWrapper = MockHttpClientWrapper();

  final LinkApi repository = LinkApiImpl(clientWrapper);

  const String newSelfString = "self";
  const String newAliasString = "alias";
  const String newShortString = "short";

  test(
      "Given a $LinkApi and a $MockHttpClientWrapper"
      "When $LinkApi shortenLink method is called and $HttpClientWrapper "
      "post method returns a right(${Map<String, dynamic>})"
      "Then $LinkApi shortenLink method should call $HttpClientWrapper "
      "post method once and return a right($ShortenLinkResponse)", () async {
    final Map<String, String> params = {'url': newSelfString};
    final Map<String, dynamic> clientResponse = {
      'alias': newAliasString,
      "_links": {
        "self": newSelfString,
        "short": newShortString,
      }
    };

    const expectedResponse = ShortenLinkResponse(
      newAliasString,
      LinksResponse(
        newSelfString,
        newShortString,
      ),
    );

    when(clientWrapper.post('/api/alias', body: params))
        .thenAnswer((_) => Future.value(right(clientResponse)));

    final response = await repository.shortenLink(newSelfString);

    verify(clientWrapper.post('/api/alias', body: params)).called(1);
    expect(response, right(expectedResponse));
  });

  test(
      "Given a $LinkApi and a $MockHttpClientWrapper"
      "When $LinkApi shortenLink method is called and $HttpClientWrapper "
      "post method returns a right(${Map<String, dynamic>}) with a bad format"
      "Then $LinkApi shortenLink method should call $HttpClientWrapper "
      "post method once and return a left($Failure))", () async {
    final Map<String, String> params = {'url': newSelfString};
    final Map<String, dynamic> clientResponse = {
      'alias': newAliasString,
      "_links": ""
    };

    const expectedResponse = Failure(message: 'An mapping error has occurred');

    when(clientWrapper.post('/api/alias', body: params))
        .thenAnswer((_) => Future.value(right(clientResponse)));

    final response = await repository.shortenLink(newSelfString);

    verify(clientWrapper.post('/api/alias', body: params)).called(1);
    expect(response, left(expectedResponse));
  });

  test(
      "Given a $LinkApi and a $MockHttpClientWrapper"
      "When $LinkApi shortenLink method is called and $HttpClientWrapper "
      "post method returns a left(Failure)"
      "Then $LinkApi shortenLink method should call $HttpClientWrapper "
      "post method once and return a left(Failure)", () async {
    final Map<String, String> params = {'url': newSelfString};

    const expectedResponse = Failure(message: 'Failure message');

    when(clientWrapper.post('/api/alias', body: params))
        .thenAnswer((_) => Future.value(left(expectedResponse)));

    final response = await repository.shortenLink(newSelfString);

    verify(clientWrapper.post('/api/alias', body: params)).called(1);
    expect(response, left(expectedResponse));
  });
}
