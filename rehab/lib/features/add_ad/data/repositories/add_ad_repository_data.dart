
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/add_ad/domain/entities/add_ad_entity.dart';

import 'package:rehab/features/add_ad/data/datasources/add_ad_remote_data_source.dart';
import 'package:rehab/features/add_ad/data/models/add_ad_model.dart';
import 'package:rehab/features/add_ad/domain/repositories/add_ad_repository_domain.dart';

@LazySingleton(as: AddAdRepositoryDomain)
class AddAdRepositoryData implements AddAdRepositoryDomain{
  final BaseAddAdRemoteDataSource remoteDataSource;


  AddAdRepositoryData(this.remoteDataSource);

@override
  Future<Result<AddAdEntity, Failure>> getAddAd() async {
    try {
      final response = await remoteDataSource.getAddAd();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
