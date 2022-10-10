import 'package:dartz/dartz.dart';
import 'package:nubank_exercise/domain/entities/link.dart';
import 'package:nubank_exercise/domain/models/failure.dart';

abstract class LinkRepository {
  Future<Either<Failure, Link>> shortenLink(String link);
}
