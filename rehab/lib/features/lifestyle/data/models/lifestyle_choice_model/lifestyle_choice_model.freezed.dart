// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lifestyle_choice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LifestyleChoiceModel {

 String get id; String get optionId; String get valueEn; String get valueAr;
/// Create a copy of LifestyleChoiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LifestyleChoiceModelCopyWith<LifestyleChoiceModel> get copyWith => _$LifestyleChoiceModelCopyWithImpl<LifestyleChoiceModel>(this as LifestyleChoiceModel, _$identity);

  /// Serializes this LifestyleChoiceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LifestyleChoiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.optionId, optionId) || other.optionId == optionId)&&(identical(other.valueEn, valueEn) || other.valueEn == valueEn)&&(identical(other.valueAr, valueAr) || other.valueAr == valueAr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,optionId,valueEn,valueAr);

@override
String toString() {
  return 'LifestyleChoiceModel(id: $id, optionId: $optionId, valueEn: $valueEn, valueAr: $valueAr)';
}


}

/// @nodoc
abstract mixin class $LifestyleChoiceModelCopyWith<$Res>  {
  factory $LifestyleChoiceModelCopyWith(LifestyleChoiceModel value, $Res Function(LifestyleChoiceModel) _then) = _$LifestyleChoiceModelCopyWithImpl;
@useResult
$Res call({
 String id, String optionId, String valueEn, String valueAr
});




}
/// @nodoc
class _$LifestyleChoiceModelCopyWithImpl<$Res>
    implements $LifestyleChoiceModelCopyWith<$Res> {
  _$LifestyleChoiceModelCopyWithImpl(this._self, this._then);

  final LifestyleChoiceModel _self;
  final $Res Function(LifestyleChoiceModel) _then;

/// Create a copy of LifestyleChoiceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? optionId = null,Object? valueEn = null,Object? valueAr = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as String,valueEn: null == valueEn ? _self.valueEn : valueEn // ignore: cast_nullable_to_non_nullable
as String,valueAr: null == valueAr ? _self.valueAr : valueAr // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LifestyleChoiceModel].
extension LifestyleChoiceModelPatterns on LifestyleChoiceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LifestyleChoiceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LifestyleChoiceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LifestyleChoiceModel value)  $default,){
final _that = this;
switch (_that) {
case _LifestyleChoiceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LifestyleChoiceModel value)?  $default,){
final _that = this;
switch (_that) {
case _LifestyleChoiceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String optionId,  String valueEn,  String valueAr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LifestyleChoiceModel() when $default != null:
return $default(_that.id,_that.optionId,_that.valueEn,_that.valueAr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String optionId,  String valueEn,  String valueAr)  $default,) {final _that = this;
switch (_that) {
case _LifestyleChoiceModel():
return $default(_that.id,_that.optionId,_that.valueEn,_that.valueAr);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String optionId,  String valueEn,  String valueAr)?  $default,) {final _that = this;
switch (_that) {
case _LifestyleChoiceModel() when $default != null:
return $default(_that.id,_that.optionId,_that.valueEn,_that.valueAr);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _LifestyleChoiceModel implements LifestyleChoiceModel {
  const _LifestyleChoiceModel({required this.id, required this.optionId, required this.valueEn, required this.valueAr});
  factory _LifestyleChoiceModel.fromJson(Map<String, dynamic> json) => _$LifestyleChoiceModelFromJson(json);

@override final  String id;
@override final  String optionId;
@override final  String valueEn;
@override final  String valueAr;

/// Create a copy of LifestyleChoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LifestyleChoiceModelCopyWith<_LifestyleChoiceModel> get copyWith => __$LifestyleChoiceModelCopyWithImpl<_LifestyleChoiceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LifestyleChoiceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LifestyleChoiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.optionId, optionId) || other.optionId == optionId)&&(identical(other.valueEn, valueEn) || other.valueEn == valueEn)&&(identical(other.valueAr, valueAr) || other.valueAr == valueAr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,optionId,valueEn,valueAr);

@override
String toString() {
  return 'LifestyleChoiceModel(id: $id, optionId: $optionId, valueEn: $valueEn, valueAr: $valueAr)';
}


}

/// @nodoc
abstract mixin class _$LifestyleChoiceModelCopyWith<$Res> implements $LifestyleChoiceModelCopyWith<$Res> {
  factory _$LifestyleChoiceModelCopyWith(_LifestyleChoiceModel value, $Res Function(_LifestyleChoiceModel) _then) = __$LifestyleChoiceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String optionId, String valueEn, String valueAr
});




}
/// @nodoc
class __$LifestyleChoiceModelCopyWithImpl<$Res>
    implements _$LifestyleChoiceModelCopyWith<$Res> {
  __$LifestyleChoiceModelCopyWithImpl(this._self, this._then);

  final _LifestyleChoiceModel _self;
  final $Res Function(_LifestyleChoiceModel) _then;

/// Create a copy of LifestyleChoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? optionId = null,Object? valueEn = null,Object? valueAr = null,}) {
  return _then(_LifestyleChoiceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as String,valueEn: null == valueEn ? _self.valueEn : valueEn // ignore: cast_nullable_to_non_nullable
as String,valueAr: null == valueAr ? _self.valueAr : valueAr // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
