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
import 'package:rehab/core/services/local_keys_service.dart' as _i13;
import 'package:rehab/features/owner/data/datasources/owner_remote_data_source.dart'
    as _i966;
import 'package:rehab/features/owner/data/repositories/owner_repository_data.dart'
    as _i291;
import 'package:rehab/features/owner/domain/repositories/owner_repository_domain.dart'
    as _i1029;
import 'package:rehab/features/owner/domain/use_cases/owner_use_case.dart'
    as _i572;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initOwner({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i966.BaseOwnerRemoteDataSource>(
      () => _i966.OwnerRemoteDataSource(
        gh<_i13.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i1029.OwnerRepositoryDomain>(
      () => _i291.OwnerRepositoryData(gh<_i966.BaseOwnerRemoteDataSource>()),
    );
    gh.lazySingleton<_i572.OwnerUseCase>(
      () => _i572.OwnerUseCase(gh<_i1029.OwnerRepositoryDomain>()),
    );
    return this;
  }
}
