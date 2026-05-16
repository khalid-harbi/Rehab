// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_log_in_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoogleLogInModel {

 int get id; String get name; String get email; String? get imageUrl;
/// Create a copy of GoogleLogInModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleLogInModelCopyWith<GoogleLogInModel> get copyWith => _$GoogleLogInModelCopyWithImpl<GoogleLogInModel>(this as GoogleLogInModel, _$identity);

  /// Serializes this GoogleLogInModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleLogInModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,imageUrl);

@override
String toString() {
  return 'GoogleLogInModel(id: $id, name: $name, email: $email, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $GoogleLogInModelCopyWith<$Res>  {
  factory $GoogleLogInModelCopyWith(GoogleLogInModel value, $Res Function(GoogleLogInModel) _then) = _$GoogleLogInModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String email, String? imageUrl
});




}
/// @nodoc
class _$GoogleLogInModelCopyWithImpl<$Res>
    implements $GoogleLogInModelCopyWith<$Res> {
  _$GoogleLogInModelCopyWithImpl(this._self, this._then);

  final GoogleLogInModel _self;
  final $Res Function(GoogleLogInModel) _then;

/// Create a copy of GoogleLogInModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GoogleLogInModel].
extension GoogleLogInModelPatterns on GoogleLogInModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoogleLogInModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoogleLogInModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoogleLogInModel value)  $default,){
final _that = this;
switch (_that) {
case _GoogleLogInModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoogleLogInModel value)?  $default,){
final _that = this;
switch (_that) {
case _GoogleLogInModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String email,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleLogInModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.imageUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String email,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _GoogleLogInModel():
return $default(_that.id,_that.name,_that.email,_that.imageUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String email,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _GoogleLogInModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoogleLogInModel implements GoogleLogInModel {
  const _GoogleLogInModel({required this.id, required this.name, required this.email, this.imageUrl});
  factory _GoogleLogInModel.fromJson(Map<String, dynamic> json) => _$GoogleLogInModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String email;
@override final  String? imageUrl;

/// Create a copy of GoogleLogInModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoogleLogInModelCopyWith<_GoogleLogInModel> get copyWith => __$GoogleLogInModelCopyWithImpl<_GoogleLogInModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoogleLogInModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleLogInModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,imageUrl);

@override
String toString() {
  return 'GoogleLogInModel(id: $id, name: $name, email: $email, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$GoogleLogInModelCopyWith<$Res> implements $GoogleLogInModelCopyWith<$Res> {
  factory _$GoogleLogInModelCopyWith(_GoogleLogInModel value, $Res Function(_GoogleLogInModel) _then) = __$GoogleLogInModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String email, String? imageUrl
});




}
/// @nodoc
class __$GoogleLogInModelCopyWithImpl<$Res>
    implements _$GoogleLogInModelCopyWith<$Res> {
  __$GoogleLogInModelCopyWithImpl(this._self, this._then);

  final _GoogleLogInModel _self;
  final $Res Function(_GoogleLogInModel) _then;

/// Create a copy of GoogleLogInModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? imageUrl = freezed,}) {
  return _then(_GoogleLogInModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
