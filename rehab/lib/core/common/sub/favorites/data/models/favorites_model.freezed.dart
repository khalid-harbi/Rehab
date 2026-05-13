// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoritesModel {

 int get id; String get userId; int get homeId; DateTime get createdAt;
/// Create a copy of FavoritesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoritesModelCopyWith<FavoritesModel> get copyWith => _$FavoritesModelCopyWithImpl<FavoritesModel>(this as FavoritesModel, _$identity);

  /// Serializes this FavoritesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.homeId, homeId) || other.homeId == homeId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,homeId,createdAt);

@override
String toString() {
  return 'FavoritesModel(id: $id, userId: $userId, homeId: $homeId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FavoritesModelCopyWith<$Res>  {
  factory $FavoritesModelCopyWith(FavoritesModel value, $Res Function(FavoritesModel) _then) = _$FavoritesModelCopyWithImpl;
@useResult
$Res call({
 int id, String userId, int homeId, DateTime createdAt
});




}
/// @nodoc
class _$FavoritesModelCopyWithImpl<$Res>
    implements $FavoritesModelCopyWith<$Res> {
  _$FavoritesModelCopyWithImpl(this._self, this._then);

  final FavoritesModel _self;
  final $Res Function(FavoritesModel) _then;

/// Create a copy of FavoritesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? homeId = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,homeId: null == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoritesModel].
extension FavoritesModelPatterns on FavoritesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoritesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoritesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoritesModel value)  $default,){
final _that = this;
switch (_that) {
case _FavoritesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoritesModel value)?  $default,){
final _that = this;
switch (_that) {
case _FavoritesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String userId,  int homeId,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoritesModel() when $default != null:
return $default(_that.id,_that.userId,_that.homeId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String userId,  int homeId,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _FavoritesModel():
return $default(_that.id,_that.userId,_that.homeId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String userId,  int homeId,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FavoritesModel() when $default != null:
return $default(_that.id,_that.userId,_that.homeId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoritesModel implements FavoritesModel {
  const _FavoritesModel({required this.id, required this.userId, required this.homeId, required this.createdAt});
  factory _FavoritesModel.fromJson(Map<String, dynamic> json) => _$FavoritesModelFromJson(json);

@override final  int id;
@override final  String userId;
@override final  int homeId;
@override final  DateTime createdAt;

/// Create a copy of FavoritesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoritesModelCopyWith<_FavoritesModel> get copyWith => __$FavoritesModelCopyWithImpl<_FavoritesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoritesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoritesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.homeId, homeId) || other.homeId == homeId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,homeId,createdAt);

@override
String toString() {
  return 'FavoritesModel(id: $id, userId: $userId, homeId: $homeId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FavoritesModelCopyWith<$Res> implements $FavoritesModelCopyWith<$Res> {
  factory _$FavoritesModelCopyWith(_FavoritesModel value, $Res Function(_FavoritesModel) _then) = __$FavoritesModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String userId, int homeId, DateTime createdAt
});




}
/// @nodoc
class __$FavoritesModelCopyWithImpl<$Res>
    implements _$FavoritesModelCopyWith<$Res> {
  __$FavoritesModelCopyWithImpl(this._self, this._then);

  final _FavoritesModel _self;
  final $Res Function(_FavoritesModel) _then;

/// Create a copy of FavoritesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? homeId = null,Object? createdAt = null,}) {
  return _then(_FavoritesModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,homeId: null == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
