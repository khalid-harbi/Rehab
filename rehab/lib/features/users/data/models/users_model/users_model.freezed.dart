// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersModel {

 String get id; String get name; DateTime get createdAt; String get imageUrl; List<UserAnswersModel> get answers; int get matchPercentage;
/// Create a copy of UsersModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersModelCopyWith<UsersModel> get copyWith => _$UsersModelCopyWithImpl<UsersModel>(this as UsersModel, _$identity);

  /// Serializes this UsersModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.answers, answers)&&(identical(other.matchPercentage, matchPercentage) || other.matchPercentage == matchPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,imageUrl,const DeepCollectionEquality().hash(answers),matchPercentage);

@override
String toString() {
  return 'UsersModel(id: $id, name: $name, createdAt: $createdAt, imageUrl: $imageUrl, answers: $answers, matchPercentage: $matchPercentage)';
}


}

/// @nodoc
abstract mixin class $UsersModelCopyWith<$Res>  {
  factory $UsersModelCopyWith(UsersModel value, $Res Function(UsersModel) _then) = _$UsersModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, DateTime createdAt, String imageUrl, List<UserAnswersModel> answers, int matchPercentage
});




}
/// @nodoc
class _$UsersModelCopyWithImpl<$Res>
    implements $UsersModelCopyWith<$Res> {
  _$UsersModelCopyWithImpl(this._self, this._then);

  final UsersModel _self;
  final $Res Function(UsersModel) _then;

/// Create a copy of UsersModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? createdAt = null,Object? imageUrl = null,Object? answers = null,Object? matchPercentage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<UserAnswersModel>,matchPercentage: null == matchPercentage ? _self.matchPercentage : matchPercentage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UsersModel].
extension UsersModelPatterns on UsersModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsersModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsersModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsersModel value)  $default,){
final _that = this;
switch (_that) {
case _UsersModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsersModel value)?  $default,){
final _that = this;
switch (_that) {
case _UsersModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  DateTime createdAt,  String imageUrl,  List<UserAnswersModel> answers,  int matchPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsersModel() when $default != null:
return $default(_that.id,_that.name,_that.createdAt,_that.imageUrl,_that.answers,_that.matchPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  DateTime createdAt,  String imageUrl,  List<UserAnswersModel> answers,  int matchPercentage)  $default,) {final _that = this;
switch (_that) {
case _UsersModel():
return $default(_that.id,_that.name,_that.createdAt,_that.imageUrl,_that.answers,_that.matchPercentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  DateTime createdAt,  String imageUrl,  List<UserAnswersModel> answers,  int matchPercentage)?  $default,) {final _that = this;
switch (_that) {
case _UsersModel() when $default != null:
return $default(_that.id,_that.name,_that.createdAt,_that.imageUrl,_that.answers,_that.matchPercentage);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _UsersModel implements UsersModel {
  const _UsersModel({required this.id, required this.name, required this.createdAt, this.imageUrl = 'https://ui-avatars.com/api/?name=Placeholder&background=random&length=1', final  List<UserAnswersModel> answers = const [], this.matchPercentage = 0}): _answers = answers;
  factory _UsersModel.fromJson(Map<String, dynamic> json) => _$UsersModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  DateTime createdAt;
@override@JsonKey() final  String imageUrl;
 final  List<UserAnswersModel> _answers;
@override@JsonKey() List<UserAnswersModel> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}

@override@JsonKey() final  int matchPercentage;

/// Create a copy of UsersModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersModelCopyWith<_UsersModel> get copyWith => __$UsersModelCopyWithImpl<_UsersModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsersModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._answers, _answers)&&(identical(other.matchPercentage, matchPercentage) || other.matchPercentage == matchPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,imageUrl,const DeepCollectionEquality().hash(_answers),matchPercentage);

@override
String toString() {
  return 'UsersModel(id: $id, name: $name, createdAt: $createdAt, imageUrl: $imageUrl, answers: $answers, matchPercentage: $matchPercentage)';
}


}

/// @nodoc
abstract mixin class _$UsersModelCopyWith<$Res> implements $UsersModelCopyWith<$Res> {
  factory _$UsersModelCopyWith(_UsersModel value, $Res Function(_UsersModel) _then) = __$UsersModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, DateTime createdAt, String imageUrl, List<UserAnswersModel> answers, int matchPercentage
});




}
/// @nodoc
class __$UsersModelCopyWithImpl<$Res>
    implements _$UsersModelCopyWith<$Res> {
  __$UsersModelCopyWithImpl(this._self, this._then);

  final _UsersModel _self;
  final $Res Function(_UsersModel) _then;

/// Create a copy of UsersModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? createdAt = null,Object? imageUrl = null,Object? answers = null,Object? matchPercentage = null,}) {
  return _then(_UsersModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<UserAnswersModel>,matchPercentage: null == matchPercentage ? _self.matchPercentage : matchPercentage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
