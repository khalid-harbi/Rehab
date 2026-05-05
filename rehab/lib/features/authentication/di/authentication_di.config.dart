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
import 'package:rehab/features/authentication/data/datasources/authentication_remote_data_source.dart'
    as _i232;
import 'package:rehab/features/authentication/data/repositories/authentication_repository_data.dart'
    as _i713;
import 'package:rehab/features/authentication/domain/repositories/authentication_repository_domain.dart'
    as _i997;
import 'package:rehab/features/authentication/domain/use_cases/authentication_use_case.dart'
    as _i572;
import 'package:rehab/features/authentication/sub/forget_password/data/datasources/forget_password_remote_data_source.dart'
    as _i222;
import 'package:rehab/features/authentication/sub/forget_password/data/repositories/forget_password_repository_data.dart'
    as _i781;
import 'package:rehab/features/authentication/sub/forget_password/domain/repositories/forget_password_repository_domain.dart'
    as _i269;
import 'package:rehab/features/authentication/sub/forget_password/domain/use_cases/forget_password_use_case.dart'
    as _i909;
import 'package:rehab/features/authentication/sub/login/data/datasources/login_remote_data_source.dart'
    as _i65;
import 'package:rehab/features/authentication/sub/login/data/repositories/login_repository_data.dart'
    as _i164;
import 'package:rehab/features/authentication/sub/login/domain/repositories/login_repository_domain.dart'
    as _i812;
import 'package:rehab/features/authentication/sub/login/domain/use_cases/login_use_case.dart'
    as _i823;
import 'package:rehab/features/authentication/sub/logout/data/datasources/logout_remote_data_source.dart'
    as _i11;
import 'package:rehab/features/authentication/sub/logout/data/repositories/logout_repository_data.dart'
    as _i35;
import 'package:rehab/features/authentication/sub/logout/domain/repositories/logout_repository_domain.dart'
    as _i781;
import 'package:rehab/features/authentication/sub/logout/domain/use_cases/logout_use_case.dart'
    as _i195;
import 'package:rehab/features/authentication/sub/sign_up/data/datasources/sign_up_remote_data_source.dart'
    as _i844;
import 'package:rehab/features/authentication/sub/sign_up/data/repositories/sign_up_repository_data.dart'
    as _i579;
import 'package:rehab/features/authentication/sub/sign_up/domain/repositories/sign_up_repository_domain.dart'
    as _i956;
import 'package:rehab/features/authentication/sub/sign_up/domain/use_cases/sign_up_use_case.dart'
    as _i578;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAuthentication({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i65.BaseLoginRemoteDataSource>(
      () => _i65.LoginRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i222.BaseForgetPasswordRemoteDataSource>(
      () => _i222.ForgetPasswordRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i11.BaseLogoutRemoteDataSource>(
      () => _i11.LogoutRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i812.LoginRepositoryDomain>(
      () => _i164.LoginRepositoryData(gh<_i65.BaseLoginRemoteDataSource>()),
    );
    gh.lazySingleton<_i844.BaseSignUpRemoteDataSource>(
      () => _i844.SignUpRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i232.BaseAuthRemoteDataSource>(
      () => _i232.AuthRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i269.ForgetPasswordRepositoryDomain>(
      () => _i781.ForgetPasswordRepositoryData(
        gh<_i222.BaseForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i781.LogoutRepositoryDomain>(
      () => _i35.LogoutRepositoryData(gh<_i11.BaseLogoutRemoteDataSource>()),
    );
    gh.lazySingleton<_i823.LoginUseCase>(
      () => _i823.LoginUseCase(gh<_i812.LoginRepositoryDomain>()),
    );
    gh.lazySingleton<_i909.ForgetPasswordUseCase>(
      () => _i909.ForgetPasswordUseCase(
        gh<_i269.ForgetPasswordRepositoryDomain>(),
      ),
    );
    gh.lazySingleton<_i956.SignUpRepositoryDomain>(
      () => _i579.SignUpRepositoryData(gh<_i844.BaseSignUpRemoteDataSource>()),
    );
    gh.lazySingleton<_i997.AuthRepositoryDomain>(
      () => _i713.AuthRepositoryData(gh<_i232.BaseAuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i195.LogoutUseCase>(
      () => _i195.LogoutUseCase(gh<_i781.LogoutRepositoryDomain>()),
    );
    gh.lazySingleton<_i572.AuthUseCase>(
      () => _i572.AuthUseCase(gh<_i997.AuthRepositoryDomain>()),
    );
    gh.lazySingleton<_i578.SignUpUseCase>(
      () => _i578.SignUpUseCase(gh<_i956.SignUpRepositoryDomain>()),
    );
    return this;
  }
}
