import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_exercise/data/apis/link_api.dart';
import 'package:nubank_exercise/data/models/shorten_link_response.dart';
import 'package:nubank_exercise/data/repositories/link/link_repository.dart';
import 'package:nubank_exercise/data/repositories/link/link_repository_impl.dart';
import 'package:nubank_exercise/domain/entities/link.dart';
import 'package:nubank_exercise/domain/models/failure.dart';

import 'link_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LinkApi>()])
void main() {
  final LinkApi linkApi = MockLinkApi();

  final LinkRepository repository = LinkRepositoryImpl(linkApi);

  const String newSelfString = "self";
  const String newAliasString = "alias";
  const String newShortString = "short";
  const Failure failure = ResourceNotFoundFailure(message: "message");
  const Link newLink = Link(
    alias: "alias",
    self: newSelfString,
    short: "short",
  );
  const ShortenLinkResponse shortenLinkResponse = ShortenLinkResponse(
    newAliasString,
    LinksResponse(
      newSelfString,
      newShortString,
    ),
  );

  test(
      "Given a $LinkRepository and a $LinkApi"
      "When $LinkRepository shortenLink method is called and $LinkApi "
      "shortenLink method returns a right(ShortenLinkResponse)"
      "Then $LinkRepository shortenLink method should call $LinkApi "
      "shortenLink method once and return a right(ShortenLinkResponse)",
      () async {
    when(linkApi.shortenLink(newSelfString))
        .thenAnswer((_) => Future.value(right(shortenLinkResponse)));

    final response = await repository.shortenLink(newSelfString);

    verify(linkApi.shortenLink(newSelfString)).called(1);
    expect(response, right(newLink));
  });

  test(
      "Given a $LinkRepository and a $LinkApi"
      "When $LinkRepository shortenLink method is called and $LinkApi "
      "shortenLink method returns a left(Failure)"
      "Then $LinkRepository shortenLink method should call $LinkApi "
      "shortenLink method once and return a left(Failure)", () async {
    when(linkApi.shortenLink(newSelfString))
        .thenAnswer((_) => Future.value(left(failure)));

    final response = await repository.shortenLink(newSelfString);

    verify(linkApi.shortenLink(newSelfString)).called(1);
    expect(response, left(failure));
  });
}
