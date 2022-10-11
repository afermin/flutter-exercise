// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/screens/home/state_management/home_cubit.dart' as _i10;
import '../data/apis/link_api.dart' as _i6;
import '../data/http_client/http_client_wrapper.dart' as _i5;
import '../data/http_client/http_error_converter.dart' as _i3;
import '../data/http_client/register_http_client_module.dart' as _i11;
import '../data/repositories/link/link_repository.dart' as _i7;
import '../data/repositories/link/link_repository_impl.dart' as _i8;
import '../domain/usecases/shorten_link_use_case.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

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
  final registerHttpClientModule = _$RegisterHttpClientModule();
  gh.factory<_i3.HttpErrorConverter>(() => _i3.HttpErrorConverter());
  gh.factory<String>(
    () => registerHttpClientModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.lazySingleton<_i4.Dio>(
      () => registerHttpClientModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i5.HttpClientWrapper>(() => _i5.HttpClientWrapper(
        get<_i4.Dio>(),
        get<_i3.HttpErrorConverter>(),
      ));
  gh.factory<_i6.LinkApi>(() => _i6.LinkApiImpl(get<_i5.HttpClientWrapper>()));
  gh.factory<_i7.LinkRepository>(
      () => _i8.LinkRepositoryImpl(get<_i6.LinkApi>()));
  gh.factory<_i9.ShortenLinkUseCase>(
      () => _i9.ShortenLinkUseCaseImpl(get<_i7.LinkRepository>()));
  gh.factory<_i10.HomeCubit>(
      () => _i10.HomeCubit(get<_i9.ShortenLinkUseCase>()));
  return get;
}

class _$RegisterHttpClientModule extends _i11.RegisterHttpClientModule {}
