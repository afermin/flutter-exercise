import 'package:equatable/equatable.dart';

// Ideally there should be more types of Failure's type classes
abstract class Failure extends Equatable {
  const Failure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}

class TimeOutFailure extends Failure {
  const TimeOutFailure({
    required String message,
  }) : super(message: message);
}

class ResourceNotFoundFailure extends Failure {
  const ResourceNotFoundFailure({
    required String message,
  }) : super(message: message);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({
    required String message,
  }) : super(message: message);
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    required String message,
  }) : super(message: message);
}

class MappingFailure extends Failure {
  const MappingFailure() : super(message: 'An mapping error has occurred');
}
