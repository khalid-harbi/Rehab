import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/core/services/local_keys_service.dart';
import 'package:rehab/features/add_ad/data/models/add_ad_model.dart';
import 'package:rehab/core/errors/network_exceptions.dart';


abstract class BaseAddAdRemoteDataSource {
  Future<AddAdModel> getAddAd();
}


@LazySingleton(as: BaseAddAdRemoteDataSource)
class AddAdRemoteDataSource implements BaseAddAdRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   AddAdRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<AddAdModel> getAddAd() async {
    try {
      return AddAdModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
