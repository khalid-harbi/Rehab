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
import 'package:rehab/features/users/data/datasources/users_remote_data_source.dart'
    as _i143;
import 'package:rehab/features/users/data/repositories/users_repository_data.dart'
    as _i346;
import 'package:rehab/features/users/domain/repositories/users_repository_domain.dart'
    as _i801;
import 'package:rehab/features/users/domain/use_cases/users_use_case.dart'
    as _i97;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initUsers({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i143.BaseUsersRemoteDataSource>(
      () => _i143.UsersRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i801.UsersRepositoryDomain>(
      () => _i346.UsersRepositoryData(gh<_i143.BaseUsersRemoteDataSource>()),
    );
    gh.lazySingleton<_i97.UsersUseCase>(
      () => _i97.UsersUseCase(gh<_i801.UsersRepositoryDomain>()),
    );
    return this;
  }
}
