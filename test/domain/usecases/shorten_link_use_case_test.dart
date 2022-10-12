import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_exercise/data/repositories/link/link_repository.dart';
import 'package:nubank_exercise/domain/entities/link.dart';
import 'package:nubank_exercise/domain/models/failure.dart';
import 'package:nubank_exercise/domain/usecases/shorten_link_use_case.dart';

import 'shorten_link_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LinkRepository>()])
void main() {
  final LinkRepository repository = MockLinkRepository();

  final ShortenLinkUseCase useCase = ShortenLinkUseCaseImpl(repository);

  const String newLinkString = "self";
  const Failure failure = UnknownFailure(message: "message");
  const Link newLink = Link(
    alias: "alias",
    self: newLinkString,
    short: "short",
  );

  test(
      "Given a $ShortenLinkUseCase and a $MockLinkRepository"
      "When $ShortenLinkUseCase invoke method is called and $MockLinkRepository "
      "shortenLink method returns a right(link)"
      "Then $ShortenLinkUseCase invoke method should call $LinkRepository "
      "shortenLink method once and return a right(Link)", () async {
    when(repository.shortenLink(newLinkString))
        .thenAnswer((_) => Future.value(right(newLink)));

    final response = await useCase.invoke(newLinkString);

    verify(repository.shortenLink(newLinkString)).called(1);
    expect(response, right(newLink));
  });

  test(
      "Given a $ShortenLinkUseCase and a $MockLinkRepository"
      "When $ShortenLinkUseCase invoke method is called and $MockLinkRepository "
      "shortenLink method returns a left(Failure)"
      "Then $ShortenLinkUseCase invoke method should call $LinkRepository "
      "shortenLink method once and return a left(Failure)", () async {
    when(repository.shortenLink(newLinkString))
        .thenAnswer((_) => Future.value(left(failure)));

    final response = await useCase.invoke(newLinkString);

    verify(repository.shortenLink(newLinkString)).called(1);
    expect(response, left(failure));
  });
}
