import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/core/services/local_keys_service.dart';
import 'package:rehab/features/authentication/sub/logout/data/models/logout_model.dart';
import 'package:rehab/core/errors/network_exceptions.dart';


abstract class BaseLogoutRemoteDataSource {
  Future<LogoutModel> getLogout();
}


@LazySingleton(as: BaseLogoutRemoteDataSource)
class LogoutRemoteDataSource implements BaseLogoutRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   LogoutRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<LogoutModel> getLogout() async {
    try {
      return LogoutModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
