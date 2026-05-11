// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_preview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoomPreviewModel {

 types.Room get room; String get displayName; String? get lastMessage;
/// Create a copy of RoomPreviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomPreviewModelCopyWith<RoomPreviewModel> get copyWith => _$RoomPreviewModelCopyWithImpl<RoomPreviewModel>(this as RoomPreviewModel, _$identity);

  /// Serializes this RoomPreviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomPreviewModel&&(identical(other.room, room) || other.room == room)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,room,displayName,lastMessage);

@override
String toString() {
  return 'RoomPreviewModel(room: $room, displayName: $displayName, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class $RoomPreviewModelCopyWith<$Res>  {
  factory $RoomPreviewModelCopyWith(RoomPreviewModel value, $Res Function(RoomPreviewModel) _then) = _$RoomPreviewModelCopyWithImpl;
@useResult
$Res call({
 types.Room room, String displayName, String? lastMessage
});




}
/// @nodoc
class _$RoomPreviewModelCopyWithImpl<$Res>
    implements $RoomPreviewModelCopyWith<$Res> {
  _$RoomPreviewModelCopyWithImpl(this._self, this._then);

  final RoomPreviewModel _self;
  final $Res Function(RoomPreviewModel) _then;

/// Create a copy of RoomPreviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? room = null,Object? displayName = null,Object? lastMessage = freezed,}) {
  return _then(_self.copyWith(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as types.Room,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomPreviewModel].
extension RoomPreviewModelPatterns on RoomPreviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomPreviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomPreviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomPreviewModel value)  $default,){
final _that = this;
switch (_that) {
case _RoomPreviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomPreviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoomPreviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( types.Room room,  String displayName,  String? lastMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomPreviewModel() when $default != null:
return $default(_that.room,_that.displayName,_that.lastMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( types.Room room,  String displayName,  String? lastMessage)  $default,) {final _that = this;
switch (_that) {
case _RoomPreviewModel():
return $default(_that.room,_that.displayName,_that.lastMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( types.Room room,  String displayName,  String? lastMessage)?  $default,) {final _that = this;
switch (_that) {
case _RoomPreviewModel() when $default != null:
return $default(_that.room,_that.displayName,_that.lastMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomPreviewModel implements RoomPreviewModel {
  const _RoomPreviewModel({required this.room, required this.displayName, required this.lastMessage});
  factory _RoomPreviewModel.fromJson(Map<String, dynamic> json) => _$RoomPreviewModelFromJson(json);

@override final  types.Room room;
@override final  String displayName;
@override final  String? lastMessage;

/// Create a copy of RoomPreviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomPreviewModelCopyWith<_RoomPreviewModel> get copyWith => __$RoomPreviewModelCopyWithImpl<_RoomPreviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomPreviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomPreviewModel&&(identical(other.room, room) || other.room == room)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,room,displayName,lastMessage);

@override
String toString() {
  return 'RoomPreviewModel(room: $room, displayName: $displayName, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class _$RoomPreviewModelCopyWith<$Res> implements $RoomPreviewModelCopyWith<$Res> {
  factory _$RoomPreviewModelCopyWith(_RoomPreviewModel value, $Res Function(_RoomPreviewModel) _then) = __$RoomPreviewModelCopyWithImpl;
@override @useResult
$Res call({
 types.Room room, String displayName, String? lastMessage
});




}
/// @nodoc
class __$RoomPreviewModelCopyWithImpl<$Res>
    implements _$RoomPreviewModelCopyWith<$Res> {
  __$RoomPreviewModelCopyWithImpl(this._self, this._then);

  final _RoomPreviewModel _self;
  final $Res Function(_RoomPreviewModel) _then;

/// Create a copy of RoomPreviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? room = null,Object? displayName = null,Object? lastMessage = freezed,}) {
  return _then(_RoomPreviewModel(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as types.Room,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
