// // import 'package:injectable/injectable.dart';
// // import 'package:supabase_flutter/supabase_flutter.dart';

// // abstract class BaseSignUpRemoteDataSource {
// //   Future<bool> getSignUp({
// //     required String name,
// //     required String email,
// //     required String password,
// //   });
// // }

// // @LazySingleton(as: BaseSignUpRemoteDataSource)
// // class SignUpRemoteDataSource implements BaseSignUpRemoteDataSource {
// //   final SupabaseClient _supabase;
// //   SignUpRemoteDataSource(this._supabase);

// //   @override
// //   Future<bool> getSignUp({
// //     required String name,
// //     required String email,
// //     required String password,
// //   }) async {
// //     final authResponse = await _supabase.auth.signUp(
// //       password: password,
// //       email: email,
// //     );

// //     await _supabase.from('profiles').insert({
// //       "id": authResponse.user?.id,
// //       "name": name,
// //       "email": email,
// //     });

// //     return true;
// //   }
// // }
// import 'package:injectable/injectable.dart';
// import 'package:rehab/core/errors/network_exceptions.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// abstract class BaseSignUpRemoteDataSource {
//   Future<bool> getSignUp({
//     required String name,
//     required String email,
//     required String password,
//   });
// }

// @LazySingleton(as: BaseSignUpRemoteDataSource)
// class SignUpRemoteDataSource implements BaseSignUpRemoteDataSource {
//   final SupabaseClient _supabase;

//   SignUpRemoteDataSource(this._supabase);

//   @override
//   Future<bool> getSignUp({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final currentUser = await _supabase.auth.signUp(
//         email: email,
//         password: password,
//       );
//       await _supabase.from("profiles").insert({
//         "id": currentUser.user!.id,
//         "auth_id": currentUser.user!.id,
//         "name": name,
//         "email": email,
//       });

//       return true;
//     } catch (error) {
//       throw FailureExceptions.getException(error);
//     }
//   }
// }
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseSignUpRemoteDataSource {
  Future<bool> getSignUp({
    required String name,
    required String email,
    required String password,
  });
}

@LazySingleton(as: BaseSignUpRemoteDataSource)
class SignUpRemoteDataSource implements BaseSignUpRemoteDataSource {
  final SupabaseClient _supabase;

  SignUpRemoteDataSource(this._supabase);

  @override
  Future<bool> getSignUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final authResponse = await _supabase.auth.signUp(
        email: email,
        password: password,

        // data: {
        //   'name': name,
        // },
      );

      return authResponse.user != null;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
