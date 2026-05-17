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
import 'package:rehab/features/my_bookings/data/datasources/my_bookings_remote_data_source.dart'
    as _i475;
import 'package:rehab/features/my_bookings/data/repositories/my_bookings_repository_data.dart'
    as _i593;
import 'package:rehab/features/my_bookings/domain/repositories/my_bookings_repository_domain.dart'
    as _i328;
import 'package:rehab/features/my_bookings/domain/use_cases/my_bookings_use_case.dart'
    as _i187;
import 'package:rehab/features/my_bookings/presentation/cubit/my_bookings_cubit.dart'
    as _i707;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initMyBookings({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i475.BaseMyBookingsRemoteDataSource>(
      () => _i475.MyBookingsRemoteDataSource(
        gh<_i13.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i328.MyBookingsRepositoryDomain>(
      () => _i593.MyBookingsRepositoryData(
        gh<_i475.BaseMyBookingsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i187.MyBookingsUseCase>(
      () => _i187.MyBookingsUseCase(gh<_i328.MyBookingsRepositoryDomain>()),
    );
    gh.factory<_i707.MyBookingsCubit>(
      () => _i707.MyBookingsCubit(gh<_i187.MyBookingsUseCase>()),
    );
    return this;
  }
}
