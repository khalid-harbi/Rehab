// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lifestyle_option_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LifestyleOptionModel {

 String get id; String get titleEn; String get titleAr; String get slug;
/// Create a copy of LifestyleOptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LifestyleOptionModelCopyWith<LifestyleOptionModel> get copyWith => _$LifestyleOptionModelCopyWithImpl<LifestyleOptionModel>(this as LifestyleOptionModel, _$identity);

  /// Serializes this LifestyleOptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LifestyleOptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleAr, titleAr) || other.titleAr == titleAr)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titleEn,titleAr,slug);

@override
String toString() {
  return 'LifestyleOptionModel(id: $id, titleEn: $titleEn, titleAr: $titleAr, slug: $slug)';
}


}

/// @nodoc
abstract mixin class $LifestyleOptionModelCopyWith<$Res>  {
  factory $LifestyleOptionModelCopyWith(LifestyleOptionModel value, $Res Function(LifestyleOptionModel) _then) = _$LifestyleOptionModelCopyWithImpl;
@useResult
$Res call({
 String id, String titleEn, String titleAr, String slug
});




}
/// @nodoc
class _$LifestyleOptionModelCopyWithImpl<$Res>
    implements $LifestyleOptionModelCopyWith<$Res> {
  _$LifestyleOptionModelCopyWithImpl(this._self, this._then);

  final LifestyleOptionModel _self;
  final $Res Function(LifestyleOptionModel) _then;

/// Create a copy of LifestyleOptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titleEn = null,Object? titleAr = null,Object? slug = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleAr: null == titleAr ? _self.titleAr : titleAr // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LifestyleOptionModel].
extension LifestyleOptionModelPatterns on LifestyleOptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LifestyleOptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LifestyleOptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LifestyleOptionModel value)  $default,){
final _that = this;
switch (_that) {
case _LifestyleOptionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LifestyleOptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _LifestyleOptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String titleEn,  String titleAr,  String slug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LifestyleOptionModel() when $default != null:
return $default(_that.id,_that.titleEn,_that.titleAr,_that.slug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String titleEn,  String titleAr,  String slug)  $default,) {final _that = this;
switch (_that) {
case _LifestyleOptionModel():
return $default(_that.id,_that.titleEn,_that.titleAr,_that.slug);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String titleEn,  String titleAr,  String slug)?  $default,) {final _that = this;
switch (_that) {
case _LifestyleOptionModel() when $default != null:
return $default(_that.id,_that.titleEn,_that.titleAr,_that.slug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LifestyleOptionModel implements LifestyleOptionModel {
  const _LifestyleOptionModel({required this.id, required this.titleEn, required this.titleAr, required this.slug});
  factory _LifestyleOptionModel.fromJson(Map<String, dynamic> json) => _$LifestyleOptionModelFromJson(json);

@override final  String id;
@override final  String titleEn;
@override final  String titleAr;
@override final  String slug;

/// Create a copy of LifestyleOptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LifestyleOptionModelCopyWith<_LifestyleOptionModel> get copyWith => __$LifestyleOptionModelCopyWithImpl<_LifestyleOptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LifestyleOptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LifestyleOptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleAr, titleAr) || other.titleAr == titleAr)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titleEn,titleAr,slug);

@override
String toString() {
  return 'LifestyleOptionModel(id: $id, titleEn: $titleEn, titleAr: $titleAr, slug: $slug)';
}


}

/// @nodoc
abstract mixin class _$LifestyleOptionModelCopyWith<$Res> implements $LifestyleOptionModelCopyWith<$Res> {
  factory _$LifestyleOptionModelCopyWith(_LifestyleOptionModel value, $Res Function(_LifestyleOptionModel) _then) = __$LifestyleOptionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String titleEn, String titleAr, String slug
});




}
/// @nodoc
class __$LifestyleOptionModelCopyWithImpl<$Res>
    implements _$LifestyleOptionModelCopyWith<$Res> {
  __$LifestyleOptionModelCopyWithImpl(this._self, this._then);

  final _LifestyleOptionModel _self;
  final $Res Function(_LifestyleOptionModel) _then;

/// Create a copy of LifestyleOptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titleEn = null,Object? titleAr = null,Object? slug = null,}) {
  return _then(_LifestyleOptionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleAr: null == titleAr ? _self.titleAr : titleAr // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
