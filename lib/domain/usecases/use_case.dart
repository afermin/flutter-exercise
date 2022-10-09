import 'package:dartz/dartz.dart';

import '../models/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> invoke(Params params);
}
