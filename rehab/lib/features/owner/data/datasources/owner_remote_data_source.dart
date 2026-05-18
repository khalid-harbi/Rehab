import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/features/owner/data/models/owner_model.dart';
import 'package:rehab/core/errors/network_exceptions.dart';


abstract class BaseOwnerRemoteDataSource {
  Future<OwnerModel> getOwner();
}


@LazySingleton(as: BaseOwnerRemoteDataSource)
class OwnerRemoteDataSource implements BaseOwnerRemoteDataSource {
 
  final SupabaseClient _supabase;
  
  

   OwnerRemoteDataSource(this._supabase);



    @override
  Future<OwnerModel> getOwner() async {
    try {
      return OwnerModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
