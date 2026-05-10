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
import 'package:rehab/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i330;
import 'package:rehab/features/auth/data/repositories/auth_repository_data.dart'
    as _i369;
import 'package:rehab/features/auth/domain/repositories/auth_repository_domain.dart'
    as _i47;
import 'package:rehab/features/auth/domain/use_cases/auth_use_case.dart'
    as _i565;
import 'package:rehab/features/auth/presentation/cubit/auth_cubit.dart'
    as _i862;
import 'package:rehab/features/auth/sub/forget_password/data/datasources/forget_password_remote_data_source.dart'
    as _i1033;
import 'package:rehab/features/auth/sub/forget_password/data/repositories/forget_password_repository_data.dart'
    as _i429;
import 'package:rehab/features/auth/sub/forget_password/domain/repositories/forget_password_repository_domain.dart'
    as _i856;
import 'package:rehab/features/auth/sub/forget_password/domain/use_cases/forget_password_use_case.dart'
    as _i803;
import 'package:rehab/features/auth/sub/login/data/datasources/login_remote_data_source.dart'
    as _i61;
import 'package:rehab/features/auth/sub/login/data/repositories/login_repository_data.dart'
    as _i367;
import 'package:rehab/features/auth/sub/login/domain/repositories/login_repository_domain.dart'
    as _i372;
import 'package:rehab/features/auth/sub/login/domain/use_cases/login_use_case.dart'
    as _i58;
import 'package:rehab/features/auth/sub/login/presentation/cubit/login_cubit.dart'
    as _i915;
import 'package:rehab/features/auth/sub/logout/data/datasources/logout_remote_data_source.dart'
    as _i416;
import 'package:rehab/features/auth/sub/logout/data/repositories/logout_repository_data.dart'
    as _i162;
import 'package:rehab/features/auth/sub/logout/domain/repositories/logout_repository_domain.dart'
    as _i548;
import 'package:rehab/features/auth/sub/logout/domain/use_cases/logout_use_case.dart'
    as _i467;
import 'package:rehab/features/auth/sub/otp/data/datasources/otp_remote_data_source.dart'
    as _i5;
import 'package:rehab/features/auth/sub/otp/data/repositories/otp_repository_data.dart'
    as _i898;
import 'package:rehab/features/auth/sub/otp/domain/repositories/otp_repository_domain.dart'
    as _i780;
import 'package:rehab/features/auth/sub/otp/domain/use_cases/otp_use_case.dart'
    as _i878;
import 'package:rehab/features/auth/sub/sign_up/data/datasources/sign_up_remote_data_source.dart'
    as _i168;
import 'package:rehab/features/auth/sub/sign_up/data/repositories/sign_up_repository_data.dart'
    as _i750;
import 'package:rehab/features/auth/sub/sign_up/domain/repositories/sign_up_repository_domain.dart'
    as _i728;
import 'package:rehab/features/auth/sub/sign_up/domain/use_cases/sign_up_use_case.dart'
    as _i400;
import 'package:rehab/features/auth/sub/sign_up/presentation/cubit/sign_up_cubit.dart'
    as _i593;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAuth({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i416.BaseLogoutRemoteDataSource>(
      () => _i416.LogoutRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i61.BaseLoginRemoteDataSource>(
      () => _i61.LoginRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i1033.BaseForgetPasswordRemoteDataSource>(
      () => _i1033.ForgetPasswordRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i5.BaseOtpRemoteDataSource>(
      () => _i5.OtpRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i330.BaseAuthRemoteDataSource>(
      () => _i330.AuthRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i168.BaseSignUpRemoteDataSource>(
      () => _i168.SignUpRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i780.OtpRepositoryDomain>(
      () => _i898.OtpRepositoryData(gh<_i5.BaseOtpRemoteDataSource>()),
    );
    gh.lazySingleton<_i728.SignUpRepositoryDomain>(
      () => _i750.SignUpRepositoryData(gh<_i168.BaseSignUpRemoteDataSource>()),
    );
    gh.lazySingleton<_i856.ForgetPasswordRepositoryDomain>(
      () => _i429.ForgetPasswordRepositoryData(
        gh<_i1033.BaseForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i548.LogoutRepositoryDomain>(
      () => _i162.LogoutRepositoryData(gh<_i416.BaseLogoutRemoteDataSource>()),
    );
    gh.lazySingleton<_i372.LoginRepositoryDomain>(
      () => _i367.LoginRepositoryData(gh<_i61.BaseLoginRemoteDataSource>()),
    );
    gh.lazySingleton<_i878.OtpUseCase>(
      () => _i878.OtpUseCase(gh<_i780.OtpRepositoryDomain>()),
    );
    gh.lazySingleton<_i467.LogoutUseCase>(
      () => _i467.LogoutUseCase(gh<_i548.LogoutRepositoryDomain>()),
    );
    gh.lazySingleton<_i58.LoginUseCase>(
      () => _i58.LoginUseCase(gh<_i372.LoginRepositoryDomain>()),
    );
    gh.lazySingleton<_i47.AuthRepositoryDomain>(
      () => _i369.AuthRepositoryData(gh<_i330.BaseAuthRemoteDataSource>()),
    );
    gh.factory<_i915.LoginCubit>(
      () => _i915.LoginCubit(gh<_i58.LoginUseCase>()),
    );
    gh.lazySingleton<_i803.ForgetPasswordUseCase>(
      () => _i803.ForgetPasswordUseCase(
        gh<_i856.ForgetPasswordRepositoryDomain>(),
      ),
    );
    gh.lazySingleton<_i565.AuthUseCase>(
      () => _i565.AuthUseCase(gh<_i47.AuthRepositoryDomain>()),
    );
    gh.lazySingleton<_i400.SignUpUseCase>(
      () => _i400.SignUpUseCase(gh<_i728.SignUpRepositoryDomain>()),
    );
    gh.factory<_i593.SignUpCubit>(
      () => _i593.SignUpCubit(gh<_i400.SignUpUseCase>()),
    );
    gh.factory<_i862.AuthCubit>(() => _i862.AuthCubit(gh<_i565.AuthUseCase>()));
    return this;
  }
}
