import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nubank_exercise/data/repositories/link/link_repository.dart';
import 'package:nubank_exercise/domain/entities/link.dart';
import 'package:nubank_exercise/domain/models/failure.dart';

@Injectable(as: LinkRepository)
class LinkRepositoryImpl extends LinkRepository {
  @override
  Future<Either<Failure, Link>> shortenLink(String link) {
    // TODO: implement shortenLink
    throw UnimplementedError();
  }
}
