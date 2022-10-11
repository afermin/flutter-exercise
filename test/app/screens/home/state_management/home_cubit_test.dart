import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_exercise/app/screens/home/state_management/home_cubit.dart';
import 'package:nubank_exercise/app/screens/home/state_management/home_state.dart';
import 'package:nubank_exercise/domain/entities/link.dart';
import 'package:nubank_exercise/domain/models/failure.dart';
import 'package:nubank_exercise/domain/usecases/shorten_link_use_case.dart';

import 'home_cubit_test.mocks.dart';

// Mock Cubit
class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

@GenerateNiceMocks([MockSpec<ShortenLinkUseCase>()])
void main() {
  MockShortenLinkUseCase useCase = MockShortenLinkUseCase();
  group('When shortening a link', () {
    const String newLinkString = "self";
    const Link newLink = Link(
      alias: "alias",
      self: newLinkString,
      short: "short",
    );

    const Failure failure = Failure(message: "message");

    blocTest<HomeCubit, HomeState>(
      'when useCase returns a either.right value '
      'then a UpdateListState with this new Link should be emitted',
      build: () => HomeCubit(useCase),
      act: (HomeCubit cubit) {
        when(useCase.invoke(newLinkString))
            .thenAnswer((_) => Future.value(right(newLink)));
        cubit.shortenLink(newLinkString);
      },
      expect: () => <HomeState>[
        const LoadingState([]),
        const UpdateListState([newLink]),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'when useCase returns a either.right value '
      'then a UpdateListState with this new Link should be emitted',
      build: () => HomeCubit(useCase),
      act: (HomeCubit cubit) {
        when(useCase.invoke(newLinkString))
            .thenAnswer((_) => Future.value(right(newLink)));
        cubit.shortenLink(newLinkString);
      },
      expect: () => <HomeState>[
        const LoadingState([]),
        const UpdateListState([newLink]),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'when useCase returns a either.left value '
      'then a ErrorState with the failure.message should be emitted',
      build: () => HomeCubit(useCase),
      act: (HomeCubit cubit) {
        when(useCase.invoke(newLinkString))
            .thenAnswer((_) => Future.value(left(failure)));
        cubit.shortenLink(newLinkString);
      },
      expect: () => <HomeState>[
        const LoadingState([]),
        ErrorState(const [], message: failure.message),
      ],
    );
  });
}
