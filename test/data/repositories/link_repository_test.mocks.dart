// Mocks generated by Mockito 5.3.2 from annotations
// in nubank_exercise/test/data/repositories/link_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:nubank_exercise/data/apis/link_api.dart' as _i3;
import 'package:nubank_exercise/data/models/shorten_link_response.dart' as _i6;
import 'package:nubank_exercise/domain/models/failure.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LinkApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockLinkApi extends _i1.Mock implements _i3.LinkApi {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.ShortenLinkResponse>> shortenLink(
          String? link) =>
      (super.noSuchMethod(
        Invocation.method(
          #shortenLink,
          [link],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.ShortenLinkResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.ShortenLinkResponse>(
          this,
          Invocation.method(
            #shortenLink,
            [link],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.ShortenLinkResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.ShortenLinkResponse>(
          this,
          Invocation.method(
            #shortenLink,
            [link],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.ShortenLinkResponse>>);
}