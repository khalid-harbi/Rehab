import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/auth/sub/google_log_in/domain/entities/google_log_in_entity.dart';

abstract class GoogleLogInRepositoryDomain {
    Future<Result<GoogleLogInEntity, Failure>> getGoogleLogIn();
    
}
