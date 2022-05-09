// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/downloads/downloads_bloc.dart' as _i12;
import '../../../application/fast_laugh/fastlaugh_bloc.dart' as _i13;
import '../../../application/home/home_bloc.dart' as _i14;
import '../../../application/hot_and_new/hotandnew_bloc.dart' as _i7;
import '../../../application/search/search_bloc.dart' as _i15;
import '../../../infrastructure/downloads/downloads_repository.dart' as _i9;
import '../../../infrastructure/home/home_impl.dart' as _i4;
import '../../../infrastructure/hot_and_new/hot_and_new_impl.dart' as _i6;
import '../../../infrastructure/search/search_implimentation.dart' as _i11;
import '../../downloads/i_downloads_repo.dart' as _i8;
import '../../home/home_service.dart' as _i3;
import '../../hot_and_new/hot_and_new_service.dart' as _i5;
import '../../search/search_service.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.HomeService>(() => _i4.HomeImplimentation());
  gh.lazySingleton<_i5.HotAndNewService>(() => _i6.HotAndNewImplementation());
  gh.factory<_i7.HotandnewBloc>(
      () => _i7.HotandnewBloc(get<_i5.HotAndNewService>()));
  gh.lazySingleton<_i8.IDownloadsRepo>(() => _i9.DownloadsRepository());
  gh.lazySingleton<_i10.SearchService>(() => _i11.SearchImplimentation());
  gh.factory<_i12.DownloadsBloc>(
      () => _i12.DownloadsBloc(get<_i8.IDownloadsRepo>()));
  gh.factory<_i13.FastlaughBloc>(
      () => _i13.FastlaughBloc(get<_i8.IDownloadsRepo>()));
  gh.factory<_i14.HomeBloc>(() => _i14.HomeBloc(get<_i3.HomeService>()));
  gh.factory<_i15.SearchBloc>(() =>
      _i15.SearchBloc(get<_i8.IDownloadsRepo>(), get<_i10.SearchService>()));
  return get;
}
