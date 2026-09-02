import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class ThirdPartyConfig {
  //----------------------------------------------------------------------------
  @lazySingleton
  GetStorage get storage => GetStorage();
  //----------------------------------------------------------------------------
  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;
  //----------------------------------------------------------------------------
  // encryptedSharedPreferences مهجور وسيُحذف في v11، والبيانات تُرحَّل
  // تلقائيًا إلى تشفير مخصّص عند أول وصول — فالوسيط صار بلا أثر.
  @lazySingleton
  FlutterSecureStorage get flutterSecureStorage =>
      const FlutterSecureStorage(aOptions: AndroidOptions());
  //----------------------------------------------------------------------------
}
