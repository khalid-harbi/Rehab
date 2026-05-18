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
import 'package:rehab/features/user_details/data/datasources/user_details_remote_data_source.dart'
    as _i904;
import 'package:rehab/features/user_details/data/repositories/user_details_repository_data.dart'
    as _i126;
import 'package:rehab/features/user_details/domain/repositories/user_details_repository_domain.dart'
    as _i678;
import 'package:rehab/features/user_details/domain/use_cases/user_details_use_case.dart'
    as _i851;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initUserDetails({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i904.BaseUserDetailsRemoteDataSource>(
      () => _i904.UserDetailsRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i678.UserDetailsRepositoryDomain>(
      () => _i126.UserDetailsRepositoryData(
        gh<_i904.BaseUserDetailsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i851.UserDetailsUseCase>(
      () => _i851.UserDetailsUseCase(gh<_i678.UserDetailsRepositoryDomain>()),
    );
    return this;
  }
}
