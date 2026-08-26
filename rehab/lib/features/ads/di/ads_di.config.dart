// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rehab/features/ads/data/datasources/ads_remote_data_source.dart'
    as _i2;
import 'package:rehab/features/ads/data/repositories/ads_repository_data.dart'
    as _i812;
import 'package:rehab/features/ads/domain/repositories/ads_repository_domain.dart'
    as _i376;
import 'package:rehab/features/ads/domain/use_cases/ads_use_case.dart' as _i519;
import 'package:rehab/features/ads/presentation/cubit/ads_cubit.dart' as _i581;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAds({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i2.BaseAdsRemoteDataSource>(
      () => _i2.AdsRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i376.AdsRepositoryDomain>(
      () => _i812.AdsRepositoryData(gh<_i2.BaseAdsRemoteDataSource>()),
    );
    gh.lazySingleton<_i519.AdsUseCase>(
      () => _i519.AdsUseCase(gh<_i376.AdsRepositoryDomain>()),
    );
    gh.factory<_i581.AdsCubit>(() => _i581.AdsCubit(gh<_i519.AdsUseCase>()));
    return this;
  }
}
