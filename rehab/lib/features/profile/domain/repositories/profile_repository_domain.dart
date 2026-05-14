import 'dart:io';

import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepositoryDomain {
  Future<Result<ProfileEntity, Failure>> getProfile();
  Future<Result<ProfileEntity, Failure>> updateProfileName(String newName);
  Future<Result<ProfileEntity, Failure>> updateProfileImage(File imageFile);
}
