import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nubank_exercise/domain/entities/link.dart';
import 'package:nubank_exercise/domain/models/failure.dart';
import 'package:nubank_exercise/domain/usecases/shorten_link_use_case.dart';

import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._shortenLinkUseCase) : super(InitState());

  final List<Link> _links = [];
  final ShortenLinkUseCase _shortenLinkUseCase;

  Future<void> shortenLink(String link) async {
    emit(const LoadingState());
    Either<Failure, Link> response = await _shortenLinkUseCase.invoke(link);

    response.fold(
      (failure) => emit(ErrorState(message: failure.message)),
      (link) {
        _links.add(link);
        emit(UpdateListState(_links));
      },
    );
  }
}
