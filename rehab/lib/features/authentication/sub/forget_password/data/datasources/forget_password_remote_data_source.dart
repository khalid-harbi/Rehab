import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/core/services/local_keys_service.dart';
import 'package:rehab/features/authentication/sub/forget_password/data/models/forget_password_model.dart';
import 'package:rehab/core/errors/network_exceptions.dart';


abstract class BaseForgetPasswordRemoteDataSource {
  Future<ForgetPasswordModel> getForgetPassword();
}


@LazySingleton(as: BaseForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSource implements BaseForgetPasswordRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   ForgetPasswordRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<ForgetPasswordModel> getForgetPassword() async {
    try {
      return ForgetPasswordModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
