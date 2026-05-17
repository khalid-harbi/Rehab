// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingModel {

 String get id;@JsonKey(name: 'seeker_id') String get seekerId;@JsonKey(name: 'owner_id') String get ownerId;@JsonKey(name: 'home_id') int get homeId; double get amount;@JsonKey(name: 'duration_months') int get durationMonths;@JsonKey(name: 'payment_id') String get paymentId; String get status;
/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingModelCopyWith<BookingModel> get copyWith => _$BookingModelCopyWithImpl<BookingModel>(this as BookingModel, _$identity);

  /// Serializes this BookingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.seekerId, seekerId) || other.seekerId == seekerId)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.homeId, homeId) || other.homeId == homeId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.durationMonths, durationMonths) || other.durationMonths == durationMonths)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,seekerId,ownerId,homeId,amount,durationMonths,paymentId,status);

@override
String toString() {
  return 'BookingModel(id: $id, seekerId: $seekerId, ownerId: $ownerId, homeId: $homeId, amount: $amount, durationMonths: $durationMonths, paymentId: $paymentId, status: $status)';
}


}

/// @nodoc
abstract mixin class $BookingModelCopyWith<$Res>  {
  factory $BookingModelCopyWith(BookingModel value, $Res Function(BookingModel) _then) = _$BookingModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'seeker_id') String seekerId,@JsonKey(name: 'owner_id') String ownerId,@JsonKey(name: 'home_id') int homeId, double amount,@JsonKey(name: 'duration_months') int durationMonths,@JsonKey(name: 'payment_id') String paymentId, String status
});




}
/// @nodoc
class _$BookingModelCopyWithImpl<$Res>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._self, this._then);

  final BookingModel _self;
  final $Res Function(BookingModel) _then;

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? seekerId = null,Object? ownerId = null,Object? homeId = null,Object? amount = null,Object? durationMonths = null,Object? paymentId = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,seekerId: null == seekerId ? _self.seekerId : seekerId // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,homeId: null == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,durationMonths: null == durationMonths ? _self.durationMonths : durationMonths // ignore: cast_nullable_to_non_nullable
as int,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingModel].
extension BookingModelPatterns on BookingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'seeker_id')  String seekerId, @JsonKey(name: 'owner_id')  String ownerId, @JsonKey(name: 'home_id')  int homeId,  double amount, @JsonKey(name: 'duration_months')  int durationMonths, @JsonKey(name: 'payment_id')  String paymentId,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
return $default(_that.id,_that.seekerId,_that.ownerId,_that.homeId,_that.amount,_that.durationMonths,_that.paymentId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'seeker_id')  String seekerId, @JsonKey(name: 'owner_id')  String ownerId, @JsonKey(name: 'home_id')  int homeId,  double amount, @JsonKey(name: 'duration_months')  int durationMonths, @JsonKey(name: 'payment_id')  String paymentId,  String status)  $default,) {final _that = this;
switch (_that) {
case _BookingModel():
return $default(_that.id,_that.seekerId,_that.ownerId,_that.homeId,_that.amount,_that.durationMonths,_that.paymentId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'seeker_id')  String seekerId, @JsonKey(name: 'owner_id')  String ownerId, @JsonKey(name: 'home_id')  int homeId,  double amount, @JsonKey(name: 'duration_months')  int durationMonths, @JsonKey(name: 'payment_id')  String paymentId,  String status)?  $default,) {final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
return $default(_that.id,_that.seekerId,_that.ownerId,_that.homeId,_that.amount,_that.durationMonths,_that.paymentId,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingModel implements BookingModel {
  const _BookingModel({required this.id, @JsonKey(name: 'seeker_id') required this.seekerId, @JsonKey(name: 'owner_id') required this.ownerId, @JsonKey(name: 'home_id') required this.homeId, required this.amount, @JsonKey(name: 'duration_months') required this.durationMonths, @JsonKey(name: 'payment_id') required this.paymentId, required this.status});
  factory _BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'seeker_id') final  String seekerId;
@override@JsonKey(name: 'owner_id') final  String ownerId;
@override@JsonKey(name: 'home_id') final  int homeId;
@override final  double amount;
@override@JsonKey(name: 'duration_months') final  int durationMonths;
@override@JsonKey(name: 'payment_id') final  String paymentId;
@override final  String status;

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingModelCopyWith<_BookingModel> get copyWith => __$BookingModelCopyWithImpl<_BookingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.seekerId, seekerId) || other.seekerId == seekerId)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.homeId, homeId) || other.homeId == homeId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.durationMonths, durationMonths) || other.durationMonths == durationMonths)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,seekerId,ownerId,homeId,amount,durationMonths,paymentId,status);

@override
String toString() {
  return 'BookingModel(id: $id, seekerId: $seekerId, ownerId: $ownerId, homeId: $homeId, amount: $amount, durationMonths: $durationMonths, paymentId: $paymentId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$BookingModelCopyWith<$Res> implements $BookingModelCopyWith<$Res> {
  factory _$BookingModelCopyWith(_BookingModel value, $Res Function(_BookingModel) _then) = __$BookingModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'seeker_id') String seekerId,@JsonKey(name: 'owner_id') String ownerId,@JsonKey(name: 'home_id') int homeId, double amount,@JsonKey(name: 'duration_months') int durationMonths,@JsonKey(name: 'payment_id') String paymentId, String status
});




}
/// @nodoc
class __$BookingModelCopyWithImpl<$Res>
    implements _$BookingModelCopyWith<$Res> {
  __$BookingModelCopyWithImpl(this._self, this._then);

  final _BookingModel _self;
  final $Res Function(_BookingModel) _then;

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? seekerId = null,Object? ownerId = null,Object? homeId = null,Object? amount = null,Object? durationMonths = null,Object? paymentId = null,Object? status = null,}) {
  return _then(_BookingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,seekerId: null == seekerId ? _self.seekerId : seekerId // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,homeId: null == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,durationMonths: null == durationMonths ? _self.durationMonths : durationMonths // ignore: cast_nullable_to_non_nullable
as int,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
