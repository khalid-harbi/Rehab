import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:rehab/features/profile/data/models/profile_model.dart';
import 'package:rehab/features/profile/domain/entities/profile_entity.dart';
import 'package:rehab/features/profile/domain/repositories/profile_repository_domain.dart';

@LazySingleton(as: ProfileRepositoryDomain)
class ProfileRepositoryData implements ProfileRepositoryDomain {
  final BaseProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryData(this.remoteDataSource);

  @override
  Future<Result<ProfileEntity, Failure>> getProfile() async {
    try {
      final response = await remoteDataSource.getProfile();
      return Success(response.toEntity());
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<ProfileEntity, Failure>> updateProfileName(
    String newName,
  ) async {
    try {
      final response = await remoteDataSource.updateProfileName(newName);
      return Success(response.toEntity());
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<ProfileEntity, Failure>> updateProfileImage(
    File imageFile,
  ) async {
    try {
      final response = await remoteDataSource.updateProfileImage(imageFile);
      return Success(response.toEntity());
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
