import 'package:equatable/equatable.dart';
import 'package:nubank_exercise/domain/entities/link.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class InitState extends HomeState {}

class LoadingState extends HomeState {
  const LoadingState();
}

class ErrorState extends HomeState {
  const ErrorState({required this.message});

  final String message;
}

class UpdateListState extends HomeState {
  const UpdateListState(this.links);

  final List<Link> links;

  @override
  List get props => [...super.props, links];
}
