import 'package:equatable/equatable.dart';

// Ideally there should be different types of Failure's type classes and Failure
// would be an abstract class
class Failure extends Equatable {
  const Failure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}
