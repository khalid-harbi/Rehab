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
import 'package:rehab/features/auth/sub/login/data/datasources/login_remote_data_source.dart'
    as _i61;
import 'package:rehab/features/auth/sub/login/data/repositories/login_repository_data.dart'
    as _i367;
import 'package:rehab/features/auth/sub/login/domain/repositories/login_repository_domain.dart'
    as _i372;
import 'package:rehab/features/auth/sub/login/domain/use_cases/login_use_case.dart'
    as _i58;
import 'package:rehab/features/auth/sub/login/presentation/cubit/login_cubit.dart'
    as _i915;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLogin({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i61.BaseLoginRemoteDataSource>(
      () => _i61.LoginRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i372.LoginRepositoryDomain>(
      () => _i367.LoginRepositoryData(gh<_i61.BaseLoginRemoteDataSource>()),
    );
    gh.lazySingleton<_i58.LoginUseCase>(
      () => _i58.LoginUseCase(gh<_i372.LoginRepositoryDomain>()),
    );
    gh.factory<_i915.LoginCubit>(
      () => _i915.LoginCubit(gh<_i58.LoginUseCase>()),
    );
    return this;
  }
}
