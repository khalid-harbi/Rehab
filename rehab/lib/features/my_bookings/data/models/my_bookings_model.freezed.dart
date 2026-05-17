// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_bookings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyBookingsModel {

 String get id; String get seekerId; String get ownerId; int get homeId; double get amount; int get durationMonths; String get paymentId; String get status;@JsonKey(name: 'home') HomeModel get home;
/// Create a copy of MyBookingsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyBookingsModelCopyWith<MyBookingsModel> get copyWith => _$MyBookingsModelCopyWithImpl<MyBookingsModel>(this as MyBookingsModel, _$identity);

  /// Serializes this MyBookingsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyBookingsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.seekerId, seekerId) || other.seekerId == seekerId)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.homeId, homeId) || other.homeId == homeId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.durationMonths, durationMonths) || other.durationMonths == durationMonths)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.status, status) || other.status == status)&&(identical(other.home, home) || other.home == home));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,seekerId,ownerId,homeId,amount,durationMonths,paymentId,status,home);

@override
String toString() {
  return 'MyBookingsModel(id: $id, seekerId: $seekerId, ownerId: $ownerId, homeId: $homeId, amount: $amount, durationMonths: $durationMonths, paymentId: $paymentId, status: $status, home: $home)';
}


}

/// @nodoc
abstract mixin class $MyBookingsModelCopyWith<$Res>  {
  factory $MyBookingsModelCopyWith(MyBookingsModel value, $Res Function(MyBookingsModel) _then) = _$MyBookingsModelCopyWithImpl;
@useResult
$Res call({
 String id, String seekerId, String ownerId, int homeId, double amount, int durationMonths, String paymentId, String status,@JsonKey(name: 'home') HomeModel home
});


$HomeModelCopyWith<$Res> get home;

}
/// @nodoc
class _$MyBookingsModelCopyWithImpl<$Res>
    implements $MyBookingsModelCopyWith<$Res> {
  _$MyBookingsModelCopyWithImpl(this._self, this._then);

  final MyBookingsModel _self;
  final $Res Function(MyBookingsModel) _then;

/// Create a copy of MyBookingsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? seekerId = null,Object? ownerId = null,Object? homeId = null,Object? amount = null,Object? durationMonths = null,Object? paymentId = null,Object? status = null,Object? home = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,seekerId: null == seekerId ? _self.seekerId : seekerId // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,homeId: null == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,durationMonths: null == durationMonths ? _self.durationMonths : durationMonths // ignore: cast_nullable_to_non_nullable
as int,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,home: null == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as HomeModel,
  ));
}
/// Create a copy of MyBookingsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeModelCopyWith<$Res> get home {
  
  return $HomeModelCopyWith<$Res>(_self.home, (value) {
    return _then(_self.copyWith(home: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyBookingsModel].
extension MyBookingsModelPatterns on MyBookingsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyBookingsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyBookingsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyBookingsModel value)  $default,){
final _that = this;
switch (_that) {
case _MyBookingsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyBookingsModel value)?  $default,){
final _that = this;
switch (_that) {
case _MyBookingsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String seekerId,  String ownerId,  int homeId,  double amount,  int durationMonths,  String paymentId,  String status, @JsonKey(name: 'home')  HomeModel home)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyBookingsModel() when $default != null:
return $default(_that.id,_that.seekerId,_that.ownerId,_that.homeId,_that.amount,_that.durationMonths,_that.paymentId,_that.status,_that.home);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String seekerId,  String ownerId,  int homeId,  double amount,  int durationMonths,  String paymentId,  String status, @JsonKey(name: 'home')  HomeModel home)  $default,) {final _that = this;
switch (_that) {
case _MyBookingsModel():
return $default(_that.id,_that.seekerId,_that.ownerId,_that.homeId,_that.amount,_that.durationMonths,_that.paymentId,_that.status,_that.home);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String seekerId,  String ownerId,  int homeId,  double amount,  int durationMonths,  String paymentId,  String status, @JsonKey(name: 'home')  HomeModel home)?  $default,) {final _that = this;
switch (_that) {
case _MyBookingsModel() when $default != null:
return $default(_that.id,_that.seekerId,_that.ownerId,_that.homeId,_that.amount,_that.durationMonths,_that.paymentId,_that.status,_that.home);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _MyBookingsModel implements MyBookingsModel {
  const _MyBookingsModel({required this.id, required this.seekerId, required this.ownerId, required this.homeId, required this.amount, required this.durationMonths, required this.paymentId, required this.status, @JsonKey(name: 'home') required this.home});
  factory _MyBookingsModel.fromJson(Map<String, dynamic> json) => _$MyBookingsModelFromJson(json);

@override final  String id;
@override final  String seekerId;
@override final  String ownerId;
@override final  int homeId;
@override final  double amount;
@override final  int durationMonths;
@override final  String paymentId;
@override final  String status;
@override@JsonKey(name: 'home') final  HomeModel home;

/// Create a copy of MyBookingsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyBookingsModelCopyWith<_MyBookingsModel> get copyWith => __$MyBookingsModelCopyWithImpl<_MyBookingsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyBookingsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyBookingsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.seekerId, seekerId) || other.seekerId == seekerId)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.homeId, homeId) || other.homeId == homeId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.durationMonths, durationMonths) || other.durationMonths == durationMonths)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.status, status) || other.status == status)&&(identical(other.home, home) || other.home == home));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,seekerId,ownerId,homeId,amount,durationMonths,paymentId,status,home);

@override
String toString() {
  return 'MyBookingsModel(id: $id, seekerId: $seekerId, ownerId: $ownerId, homeId: $homeId, amount: $amount, durationMonths: $durationMonths, paymentId: $paymentId, status: $status, home: $home)';
}


}

/// @nodoc
abstract mixin class _$MyBookingsModelCopyWith<$Res> implements $MyBookingsModelCopyWith<$Res> {
  factory _$MyBookingsModelCopyWith(_MyBookingsModel value, $Res Function(_MyBookingsModel) _then) = __$MyBookingsModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String seekerId, String ownerId, int homeId, double amount, int durationMonths, String paymentId, String status,@JsonKey(name: 'home') HomeModel home
});


@override $HomeModelCopyWith<$Res> get home;

}
/// @nodoc
class __$MyBookingsModelCopyWithImpl<$Res>
    implements _$MyBookingsModelCopyWith<$Res> {
  __$MyBookingsModelCopyWithImpl(this._self, this._then);

  final _MyBookingsModel _self;
  final $Res Function(_MyBookingsModel) _then;

/// Create a copy of MyBookingsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? seekerId = null,Object? ownerId = null,Object? homeId = null,Object? amount = null,Object? durationMonths = null,Object? paymentId = null,Object? status = null,Object? home = null,}) {
  return _then(_MyBookingsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,seekerId: null == seekerId ? _self.seekerId : seekerId // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,homeId: null == homeId ? _self.homeId : homeId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,durationMonths: null == durationMonths ? _self.durationMonths : durationMonths // ignore: cast_nullable_to_non_nullable
as int,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,home: null == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as HomeModel,
  ));
}

/// Create a copy of MyBookingsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeModelCopyWith<$Res> get home {
  
  return $HomeModelCopyWith<$Res>(_self.home, (value) {
    return _then(_self.copyWith(home: value));
  });
}
}

// dart format on
