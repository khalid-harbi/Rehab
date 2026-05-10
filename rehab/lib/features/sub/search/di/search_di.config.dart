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
import 'package:rehab/features/sub/search/data/datasources/search_remote_data_source.dart'
    as _i774;
import 'package:rehab/features/sub/search/data/repositories/search_repository_data.dart'
    as _i5;
import 'package:rehab/features/sub/search/domain/repositories/search_repository_domain.dart'
    as _i716;
import 'package:rehab/features/sub/search/domain/use_cases/search_use_case.dart'
    as _i993;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initSearchSub({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i774.BaseSearchRemoteDataSource>(
      () => _i774.SearchRemoteDataSource(
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i716.SearchRepositoryDomain>(
      () => _i5.SearchRepositoryData(gh<_i774.BaseSearchRemoteDataSource>()),
    );
    gh.lazySingleton<_i993.SearchUseCase>(
      () => _i993.SearchUseCase(gh<_i716.SearchRepositoryDomain>()),
    );
    return this;
  }
}
