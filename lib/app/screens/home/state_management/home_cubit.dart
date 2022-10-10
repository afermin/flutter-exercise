import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nubank_exercise/domain/entities/link.dart';
import 'package:nubank_exercise/domain/models/failure.dart';
import 'package:nubank_exercise/domain/usecases/shorten_link_use_case.dart';

import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._shortenLinkUseCase) : super(const InitState([]));

  List<Link> _links = List.unmodifiable([]);
  final ShortenLinkUseCase _shortenLinkUseCase;

  Future<void> shortenLink(String link) async {
    emit(LoadingState(_links));
    Either<Failure, Link> response = await _shortenLinkUseCase.invoke(link);

    response.fold(
      (failure) => emit(ErrorState(_links, message: failure.message)),
      (newLink) {
        _links = List.unmodifiable([newLink, ..._links]);
        emit(UpdateListState(_links));
      },
    );
  }
}
