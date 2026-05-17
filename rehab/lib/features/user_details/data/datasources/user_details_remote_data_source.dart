import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/core/services/local_keys_service.dart';
import 'package:rehab/features/user_details/data/models/user_details_model.dart';
import 'package:rehab/core/errors/network_exceptions.dart';


abstract class BaseUserDetailsRemoteDataSource {
  Future<UserDetailsModel> getUserDetails();
}


@LazySingleton(as: BaseUserDetailsRemoteDataSource)
class UserDetailsRemoteDataSource implements BaseUserDetailsRemoteDataSource {
 
  final SupabaseClient _supabase;
  
  

   UserDetailsRemoteDataSource(this._supabase);



    @override
  Future<UserDetailsModel> getUserDetails() async {
    try {
      return UserDetailsModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
