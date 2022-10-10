import 'package:equatable/equatable.dart';
import 'package:nubank_exercise/domain/entities/link.dart';

abstract class HomeState extends Equatable {
  const HomeState(this.links);

  final List<Link> links;

  @override
  List<Object?> get props => [links];
}

class InitState extends HomeState {
  const InitState(List<Link> links) : super(links);
}

class LoadingState extends HomeState {
  const LoadingState(List<Link> links) : super(links);
}

class ErrorState extends HomeState {
  const ErrorState(List<Link> links, {required this.message}) : super(links);

  final String message;

  @override
  List get props => [...super.props, message];
}

class UpdateListState extends HomeState {
  const UpdateListState(List<Link> links) : super(links);
}
