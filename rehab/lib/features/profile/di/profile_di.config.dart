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
import 'package:rehab/features/profile/data/datasources/profile_remote_data_source.dart'
    as _i211;
import 'package:rehab/features/profile/data/repositories/profile_repository_data.dart'
    as _i757;
import 'package:rehab/features/profile/domain/repositories/profile_repository_domain.dart'
    as _i855;
import 'package:rehab/features/profile/domain/use_cases/profile_use_case.dart'
    as _i659;
import 'package:rehab/features/profile/presentation/cubit/profile_cubit.dart'
    as _i834;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initProfile({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i211.BaseProfileRemoteDataSource>(
      () => _i211.ProfileRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i855.ProfileRepositoryDomain>(
      () =>
          _i757.ProfileRepositoryData(gh<_i211.BaseProfileRemoteDataSource>()),
    );
    gh.lazySingleton<_i659.ProfileUseCase>(
      () => _i659.ProfileUseCase(gh<_i855.ProfileRepositoryDomain>()),
    );
    gh.factory<_i834.ProfileCubit>(
      () => _i834.ProfileCubit(gh<_i659.ProfileUseCase>()),
    );
    return this;
  }
}
