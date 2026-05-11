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
import 'package:rehab/features/conversation/data/datasources/conversation_remote_data_source.dart'
    as _i379;
import 'package:rehab/features/conversation/data/repositories/conversation_repository_data.dart'
    as _i724;
import 'package:rehab/features/conversation/domain/repositories/conversation_repository_domain.dart'
    as _i383;
import 'package:rehab/features/conversation/domain/use_cases/conversation_use_case.dart'
    as _i648;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initConversation({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i379.BaseConversationRemoteDataSource>(
      () => _i379.ConversationRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i383.ConversationRepositoryDomain>(
      () => _i724.ConversationRepositoryData(
        gh<_i379.BaseConversationRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i648.ConversationUseCase>(
      () => _i648.ConversationUseCase(gh<_i383.ConversationRepositoryDomain>()),
    );
    return this;
  }
}
