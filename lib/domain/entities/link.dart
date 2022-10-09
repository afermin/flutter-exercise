import 'package:equatable/equatable.dart';

class Link extends Equatable {
  final String alias;
  final String self;
  final String short;

  const Link({
    required this.alias,
    required this.self,
    required this.short,
  });

  @override
  List<Object?> get props => [alias, self, short];
}
