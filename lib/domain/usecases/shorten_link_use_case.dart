import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nubank_exercise/domain/models/failure.dart';
import 'package:nubank_exercise/domain/usecases/use_case.dart';

import '../entities/link.dart';

abstract class ShortenLinkUseCase extends UseCase<Link, String> {}

@injectable
class ShortenLinkUseCaseImpl implements ShortenLinkUseCase {
  @override
  Future<Either<Failure, Link>> invoke(String params) {
    // TODO: implement invoke
    throw UnimplementedError();
  }
}
