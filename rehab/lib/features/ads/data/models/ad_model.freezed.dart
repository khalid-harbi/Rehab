// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdModel {

 int get id; String get titleAr; String get titleEn; String get subtitleAr; String get subtitleEn; String get imageUrl; String? get actionUrl; int? get homeId; bool get isActive; int get sortOrder;
/// Create a copy of AdModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdModelCopyWith<AdModel> get copyWith => _$AdModelCopyWithImpl<AdModel>(this as AdModel, _$identity);

  /// Serializes this AdModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titleAr, titleAr) || other.titleAr == titleAr)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.subtitleAr, subtitleAr) || other.subtitleAr == subtitleAr)&&(identical(other.subtitleEn, subtitleEn) || other.subtitleEn == subtitleEn)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.actionUrl, actionUrl) || other.actionUrl == actionUrl)&&(identical(other.homeId, homeId) || other.homeId == homeId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titleAr,titleEn,subtitleAr,subtitleEn,imageUrl,actionUrl,homeId,isActive,sortOrder);

@override
String toString() {
  return 'AdModel(id: $id, titleAr: $titleAr, titleEn: $titleEn, subtitleAr: $subtitleAr, subtitleEn: $subtitleEn, imageUrl: $imageUrl, actionUrl: $actionUrl, homeId: $homeId, isActive: $isActive, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $AdModelCopyWith<$Res>  {
  factory $AdModelCopyWith(AdModel value, $Res Function(AdModel) _then) = _$AdModelCopyWithImpl;
@useResult
$Res call({
 int id, String titleAr, String titleEn, String subtitleAr, String subtitleEn, String imageUrl, String? actionUrl, int? homeId, bool isActive, int sortOrder
});




}
/// @nodoc
class _$AdModelCopyWithImpl<$Res>
    implements $AdModelCopyWith<$Res> {
  _$AdModelCopyWithImpl(this._self, this._then);

  final AdModel _self;
  final $Res Function(AdModel) _then;

/// Create a copy of AdModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titleAr = null,Object? titleEn = null,Object? subtitleAr = null,Object? subtitleEn = null,Object? imageUrl = null,Object? actionUrl = freezed,Object? homeId = freezed,Object? isActive = null,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,titleAr: null == titleAr ? _self.titleAr : titleAr // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,subtitleAr: null == subtitleAr ? _self.subtitleAr : subtitleAr // ignore: cast_nullable_to_non_nullable
as String,subtitleEn: null == subtitleEn ? _self.subtitleEn : subtitleEn // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,actionUrl: freezed == actionUrl ? _self.actionUrl : actionUrl // ignore: cast_nullable_to_non_nullable
as String?,homeId: freezed == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AdModel].
extension AdModelPatterns on AdModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdModel value)  $default,){
final _that = this;
switch (_that) {
case _AdModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdModel value)?  $default,){
final _that = this;
switch (_that) {
case _AdModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String titleAr,  String titleEn,  String subtitleAr,  String subtitleEn,  String imageUrl,  String? actionUrl,  int? homeId,  bool isActive,  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdModel() when $default != null:
return $default(_that.id,_that.titleAr,_that.titleEn,_that.subtitleAr,_that.subtitleEn,_that.imageUrl,_that.actionUrl,_that.homeId,_that.isActive,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String titleAr,  String titleEn,  String subtitleAr,  String subtitleEn,  String imageUrl,  String? actionUrl,  int? homeId,  bool isActive,  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _AdModel():
return $default(_that.id,_that.titleAr,_that.titleEn,_that.subtitleAr,_that.subtitleEn,_that.imageUrl,_that.actionUrl,_that.homeId,_that.isActive,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String titleAr,  String titleEn,  String subtitleAr,  String subtitleEn,  String imageUrl,  String? actionUrl,  int? homeId,  bool isActive,  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _AdModel() when $default != null:
return $default(_that.id,_that.titleAr,_that.titleEn,_that.subtitleAr,_that.subtitleEn,_that.imageUrl,_that.actionUrl,_that.homeId,_that.isActive,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _AdModel implements AdModel {
  const _AdModel({required this.id, this.titleAr = '', this.titleEn = '', this.subtitleAr = '', this.subtitleEn = '', this.imageUrl = '', this.actionUrl, this.homeId, this.isActive = true, this.sortOrder = 0});
  factory _AdModel.fromJson(Map<String, dynamic> json) => _$AdModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String titleAr;
@override@JsonKey() final  String titleEn;
@override@JsonKey() final  String subtitleAr;
@override@JsonKey() final  String subtitleEn;
@override@JsonKey() final  String imageUrl;
@override final  String? actionUrl;
@override final  int? homeId;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  int sortOrder;

/// Create a copy of AdModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdModelCopyWith<_AdModel> get copyWith => __$AdModelCopyWithImpl<_AdModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titleAr, titleAr) || other.titleAr == titleAr)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.subtitleAr, subtitleAr) || other.subtitleAr == subtitleAr)&&(identical(other.subtitleEn, subtitleEn) || other.subtitleEn == subtitleEn)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.actionUrl, actionUrl) || other.actionUrl == actionUrl)&&(identical(other.homeId, homeId) || other.homeId == homeId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titleAr,titleEn,subtitleAr,subtitleEn,imageUrl,actionUrl,homeId,isActive,sortOrder);

@override
String toString() {
  return 'AdModel(id: $id, titleAr: $titleAr, titleEn: $titleEn, subtitleAr: $subtitleAr, subtitleEn: $subtitleEn, imageUrl: $imageUrl, actionUrl: $actionUrl, homeId: $homeId, isActive: $isActive, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$AdModelCopyWith<$Res> implements $AdModelCopyWith<$Res> {
  factory _$AdModelCopyWith(_AdModel value, $Res Function(_AdModel) _then) = __$AdModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String titleAr, String titleEn, String subtitleAr, String subtitleEn, String imageUrl, String? actionUrl, int? homeId, bool isActive, int sortOrder
});




}
/// @nodoc
class __$AdModelCopyWithImpl<$Res>
    implements _$AdModelCopyWith<$Res> {
  __$AdModelCopyWithImpl(this._self, this._then);

  final _AdModel _self;
  final $Res Function(_AdModel) _then;

/// Create a copy of AdModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titleAr = null,Object? titleEn = null,Object? subtitleAr = null,Object? subtitleEn = null,Object? imageUrl = null,Object? actionUrl = freezed,Object? homeId = freezed,Object? isActive = null,Object? sortOrder = null,}) {
  return _then(_AdModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,titleAr: null == titleAr ? _self.titleAr : titleAr // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,subtitleAr: null == subtitleAr ? _self.subtitleAr : subtitleAr // ignore: cast_nullable_to_non_nullable
as String,subtitleEn: null == subtitleEn ? _self.subtitleEn : subtitleEn // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,actionUrl: freezed == actionUrl ? _self.actionUrl : actionUrl // ignore: cast_nullable_to_non_nullable
as String?,homeId: freezed == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
