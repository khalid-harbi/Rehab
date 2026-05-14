// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_answers_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserAnswersModel {

 String get id; String get answerEn; String get answerAr;
/// Create a copy of UserAnswersModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAnswersModelCopyWith<UserAnswersModel> get copyWith => _$UserAnswersModelCopyWithImpl<UserAnswersModel>(this as UserAnswersModel, _$identity);

  /// Serializes this UserAnswersModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAnswersModel&&(identical(other.id, id) || other.id == id)&&(identical(other.answerEn, answerEn) || other.answerEn == answerEn)&&(identical(other.answerAr, answerAr) || other.answerAr == answerAr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,answerEn,answerAr);

@override
String toString() {
  return 'UserAnswersModel(id: $id, answerEn: $answerEn, answerAr: $answerAr)';
}


}

/// @nodoc
abstract mixin class $UserAnswersModelCopyWith<$Res>  {
  factory $UserAnswersModelCopyWith(UserAnswersModel value, $Res Function(UserAnswersModel) _then) = _$UserAnswersModelCopyWithImpl;
@useResult
$Res call({
 String id, String answerEn, String answerAr
});




}
/// @nodoc
class _$UserAnswersModelCopyWithImpl<$Res>
    implements $UserAnswersModelCopyWith<$Res> {
  _$UserAnswersModelCopyWithImpl(this._self, this._then);

  final UserAnswersModel _self;
  final $Res Function(UserAnswersModel) _then;

/// Create a copy of UserAnswersModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? answerEn = null,Object? answerAr = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,answerEn: null == answerEn ? _self.answerEn : answerEn // ignore: cast_nullable_to_non_nullable
as String,answerAr: null == answerAr ? _self.answerAr : answerAr // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAnswersModel].
extension UserAnswersModelPatterns on UserAnswersModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAnswersModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAnswersModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAnswersModel value)  $default,){
final _that = this;
switch (_that) {
case _UserAnswersModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAnswersModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserAnswersModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String answerEn,  String answerAr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAnswersModel() when $default != null:
return $default(_that.id,_that.answerEn,_that.answerAr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String answerEn,  String answerAr)  $default,) {final _that = this;
switch (_that) {
case _UserAnswersModel():
return $default(_that.id,_that.answerEn,_that.answerAr);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String answerEn,  String answerAr)?  $default,) {final _that = this;
switch (_that) {
case _UserAnswersModel() when $default != null:
return $default(_that.id,_that.answerEn,_that.answerAr);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _UserAnswersModel implements UserAnswersModel {
  const _UserAnswersModel({required this.id, required this.answerEn, required this.answerAr});
  factory _UserAnswersModel.fromJson(Map<String, dynamic> json) => _$UserAnswersModelFromJson(json);

@override final  String id;
@override final  String answerEn;
@override final  String answerAr;

/// Create a copy of UserAnswersModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAnswersModelCopyWith<_UserAnswersModel> get copyWith => __$UserAnswersModelCopyWithImpl<_UserAnswersModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAnswersModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAnswersModel&&(identical(other.id, id) || other.id == id)&&(identical(other.answerEn, answerEn) || other.answerEn == answerEn)&&(identical(other.answerAr, answerAr) || other.answerAr == answerAr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,answerEn,answerAr);

@override
String toString() {
  return 'UserAnswersModel(id: $id, answerEn: $answerEn, answerAr: $answerAr)';
}


}

/// @nodoc
abstract mixin class _$UserAnswersModelCopyWith<$Res> implements $UserAnswersModelCopyWith<$Res> {
  factory _$UserAnswersModelCopyWith(_UserAnswersModel value, $Res Function(_UserAnswersModel) _then) = __$UserAnswersModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String answerEn, String answerAr
});




}
/// @nodoc
class __$UserAnswersModelCopyWithImpl<$Res>
    implements _$UserAnswersModelCopyWith<$Res> {
  __$UserAnswersModelCopyWithImpl(this._self, this._then);

  final _UserAnswersModel _self;
  final $Res Function(_UserAnswersModel) _then;

/// Create a copy of UserAnswersModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? answerEn = null,Object? answerAr = null,}) {
  return _then(_UserAnswersModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,answerEn: null == answerEn ? _self.answerEn : answerEn // ignore: cast_nullable_to_non_nullable
as String,answerAr: null == answerAr ? _self.answerAr : answerAr // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
