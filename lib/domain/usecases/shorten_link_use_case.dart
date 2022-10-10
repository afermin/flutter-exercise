import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nubank_exercise/data/repositories/link/link_repository.dart';
import 'package:nubank_exercise/domain/models/failure.dart';
import 'package:nubank_exercise/domain/usecases/use_case.dart';

import '../entities/link.dart';

abstract class ShortenLinkUseCase extends UseCase<Link, String> {}

@Injectable(as: ShortenLinkUseCase)
class ShortenLinkUseCaseImpl implements ShortenLinkUseCase {
  ShortenLinkUseCaseImpl(this.linkRepository);

  final LinkRepository linkRepository;

  @override
  Future<Either<Failure, Link>> invoke(String params) {
    return linkRepository.shortenLink(params);
  }
}
