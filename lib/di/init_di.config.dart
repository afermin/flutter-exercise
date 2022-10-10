// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/screens/home/state_management/home_cubit.dart' as _i9;
import '../data/apis/link_api.dart' as _i5;
import '../data/httpClient/http_client_wrapper.dart' as _i4;
import '../data/httpClient/http_error_converter.dart' as _i3;
import '../data/repositories/link/link_repository.dart' as _i6;
import '../data/repositories/link/link_repository_impl.dart' as _i7;
import '../domain/usecases/shorten_link_use_case.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.HttpErrorConverter>(() => _i3.HttpErrorConverter());
  gh.factory<_i4.HttpClientWrapper>(
      () => _i4.HttpClientWrapper(get<_i3.HttpErrorConverter>()));
  gh.factory<_i5.LinkApi>(() => _i5.LinkApiImpl(get<_i4.HttpClientWrapper>()));
  gh.factory<_i6.LinkRepository>(
      () => _i7.LinkRepositoryImpl(get<_i5.LinkApi>()));
  gh.factory<_i8.ShortenLinkUseCase>(
      () => _i8.ShortenLinkUseCaseImpl(get<_i6.LinkRepository>()));
  gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(get<_i8.ShortenLinkUseCase>()));
  return get;
}
