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
import 'package:rehab/features/home_details/domain/repositories/home_details_repository_domain.dart'
    as _i47;
import 'package:rehab/features/home_details/domain/use_cases/home_details_use_case.dart'
    as _i431;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHomeDetails({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i431.HomeDetailsUseCase>(
      () => _i431.HomeDetailsUseCase(gh<_i47.HomeDetailsRepositoryDomain>()),
    );
    return this;
  }
}
