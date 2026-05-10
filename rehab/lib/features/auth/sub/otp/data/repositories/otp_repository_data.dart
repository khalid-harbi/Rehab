
// import 'package:injectable/injectable.dart';
// import 'package:multiple_result/multiple_result.dart';
// import 'package:rehab/core/errors/network_exceptions.dart';
// import 'package:rehab/core/errors/failure.dart';
// import 'package:rehab/features/auth/sub/otp/domain/entities/otp_entity.dart';

// import 'package:rehab/features/auth/sub/otp/data/datasources/otp_remote_data_source.dart';
// import 'package:rehab/features/auth/sub/otp/data/models/otp_model.dart';
// import 'package:rehab/features/auth/sub/otp/domain/repositories/otp_repository_domain.dart';

// @LazySingleton(as: OtpRepositoryDomain)
// class OtpRepositoryData implements OtpRepositoryDomain{
//   final BaseOtpRemoteDataSource remoteDataSource;


//   OtpRepositoryData(this.remoteDataSource);

// @override
//   Future<Result<OtpEntity, Failure>> getOtp() async {
//     try {
//       final response = await remoteDataSource.getOtp();
//       return Success(response.toEntity());
//     } catch (error) {
//       return Error(FailureExceptions.getException(error));
//     }
//   }
//   @override
//   Future<Result<OtpEntity, Failure>> sendOtp(String email) async {
//     try {
//       await remoteDataSource.sendOtp(email);
//       return Success();
//     } catch (error) {
//       return Error(FailureExceptions.getException(error));
//     }
//   }@override
//   Future<Result<OtpEntity, Failure>> verifyOtp(String email, String token) async {
//     try {
//       final response = await remoteDataSource.verifyOtp(email: email, token: token);
//       return Success(response.toEntity());
//     } catch (error) {
//       return Error(FailureExceptions.getException(error));
//     }
//   }
// }
// features/auth/sub/otp/data/repositories/otp_repository_data.dart
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/auth/sub/otp/data/datasources/otp_remote_data_source.dart';
import 'package:rehab/features/auth/sub/otp/domain/repositories/otp_repository_domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: OtpRepositoryDomain)
class OtpRepositoryData implements OtpRepositoryDomain {
  final BaseOtpRemoteDataSource remoteDataSource;

  OtpRepositoryData(this.remoteDataSource);

  @override
  Future<Result<Unit, Failure>> sendOtp(String email) async {
    try {
      await remoteDataSource.sendOtp(email);
      return const Success(unit);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<AuthResponse, Failure>> verifyOtp({
    required String email, 
    required String token,
  }) async {
    try {
      final response = await remoteDataSource.verifyOtp(email: email, token: token);
      return Success(response);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}