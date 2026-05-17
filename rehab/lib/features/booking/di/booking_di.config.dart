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
import 'package:rehab/features/booking/data/datasources/booking_remote_data_source.dart'
    as _i547;
import 'package:rehab/features/booking/data/repositories/booking_repository_data.dart'
    as _i560;
import 'package:rehab/features/booking/domain/repositories/booking_repository_domain.dart'
    as _i358;
import 'package:rehab/features/booking/domain/use_cases/booking_use_case.dart'
    as _i108;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initBooking({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i547.BaseBookingRemoteDataSource>(
      () => _i547.BookingRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i358.BookingRepositoryDomain>(
      () =>
          _i560.BookingRepositoryData(gh<_i547.BaseBookingRemoteDataSource>()),
    );
    gh.lazySingleton<_i108.BookingUseCase>(
      () => _i108.BookingUseCase(gh<_i358.BookingRepositoryDomain>()),
    );
    return this;
  }
}
