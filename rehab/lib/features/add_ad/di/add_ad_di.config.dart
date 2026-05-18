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
import 'package:rehab/features/add_ad/data/datasources/add_ad_remote_data_source.dart'
    as _i901;
import 'package:rehab/features/add_ad/data/repositories/add_ad_repository_data.dart'
    as _i470;
import 'package:rehab/features/add_ad/domain/repositories/add_ad_repository_domain.dart'
    as _i303;
import 'package:rehab/features/add_ad/domain/use_cases/add_ad_use_case.dart'
    as _i1035;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAddAd({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i901.BaseAddAdRemoteDataSource>(
      () => _i901.AddAdRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i303.AddAdRepositoryDomain>(
      () => _i470.AddAdRepositoryData(gh<_i901.BaseAddAdRemoteDataSource>()),
    );
    gh.lazySingleton<_i1035.AddAdUseCase>(
      () => _i1035.AddAdUseCase(gh<_i303.AddAdRepositoryDomain>()),
    );
    return this;
  }
}
