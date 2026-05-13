import 'dart:io';

import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/profile/domain/entities/profile_entity.dart';
import 'package:rehab/features/profile/domain/repositories/profile_repository_domain.dart';

@lazySingleton
class ProfileUseCase {
  final ProfileRepositoryDomain _repositoryData;

  ProfileUseCase(this._repositoryData);

  Future<Result<ProfileEntity, Failure>> getProfile() async {
    return _repositoryData.getProfile();
  }

  Future<Result<ProfileEntity, Failure>> updateName(String newName) async {
    return _repositoryData.updateProfileName(newName);
  }

  Future<Result<ProfileEntity, Failure>> updateProfileImage(
    File imageFile,
  ) async {
    return _repositoryData.updateProfileImage(imageFile);
  }
}
