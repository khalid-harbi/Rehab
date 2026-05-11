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
import 'package:rehab/features/chat/data/datasources/chat_remote_data_source.dart'
    as _i501;
import 'package:rehab/features/chat/data/repositories/chat_repository_data.dart'
    as _i520;
import 'package:rehab/features/chat/domain/repositories/chat_repository_domain.dart'
    as _i232;
import 'package:rehab/features/chat/domain/use_cases/chat_use_case.dart'
    as _i325;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initChat({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i501.BaseChatRemoteDataSource>(
      () => _i501.ChatRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i232.ChatRepositoryDomain>(
      () => _i520.ChatRepositoryData(gh<_i501.BaseChatRemoteDataSource>()),
    );
    gh.lazySingleton<_i325.ChatUseCase>(
      () => _i325.ChatUseCase(gh<_i232.ChatRepositoryDomain>()),
    );
    return this;
  }
}
