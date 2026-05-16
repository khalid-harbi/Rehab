// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeModel {

 int get id; String get title; String get city; String get district;@JsonKey(name: 'image_url') String get imageUrl; double get price; double get rating; int get rooms; int get bathrooms; String get description;@JsonKey(name: 'is_available') bool get isAvailable;@JsonKey(name: 'property_type') String get propertyType; double get area;
/// Create a copy of HomeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeModelCopyWith<HomeModel> get copyWith => _$HomeModelCopyWithImpl<HomeModel>(this as HomeModel, _$identity);

  /// Serializes this HomeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.description, description) || other.description == description)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.propertyType, propertyType) || other.propertyType == propertyType)&&(identical(other.area, area) || other.area == area));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,city,district,imageUrl,price,rating,rooms,bathrooms,description,isAvailable,propertyType,area);

@override
String toString() {
  return 'HomeModel(id: $id, title: $title, city: $city, district: $district, imageUrl: $imageUrl, price: $price, rating: $rating, rooms: $rooms, bathrooms: $bathrooms, description: $description, isAvailable: $isAvailable, propertyType: $propertyType, area: $area)';
}


}

/// @nodoc
abstract mixin class $HomeModelCopyWith<$Res>  {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) _then) = _$HomeModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String city, String district,@JsonKey(name: 'image_url') String imageUrl, double price, double rating, int rooms, int bathrooms, String description,@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'property_type') String propertyType, double area
});




}
/// @nodoc
class _$HomeModelCopyWithImpl<$Res>
    implements $HomeModelCopyWith<$Res> {
  _$HomeModelCopyWithImpl(this._self, this._then);

  final HomeModel _self;
  final $Res Function(HomeModel) _then;

/// Create a copy of HomeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? city = null,Object? district = null,Object? imageUrl = null,Object? price = null,Object? rating = null,Object? rooms = null,Object? bathrooms = null,Object? description = null,Object? isAvailable = null,Object? propertyType = null,Object? area = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,propertyType: null == propertyType ? _self.propertyType : propertyType // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeModel].
extension HomeModelPatterns on HomeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeModel value)  $default,){
final _that = this;
switch (_that) {
case _HomeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeModel value)?  $default,){
final _that = this;
switch (_that) {
case _HomeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String city,  String district, @JsonKey(name: 'image_url')  String imageUrl,  double price,  double rating,  int rooms,  int bathrooms,  String description, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'property_type')  String propertyType,  double area)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeModel() when $default != null:
return $default(_that.id,_that.title,_that.city,_that.district,_that.imageUrl,_that.price,_that.rating,_that.rooms,_that.bathrooms,_that.description,_that.isAvailable,_that.propertyType,_that.area);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String city,  String district, @JsonKey(name: 'image_url')  String imageUrl,  double price,  double rating,  int rooms,  int bathrooms,  String description, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'property_type')  String propertyType,  double area)  $default,) {final _that = this;
switch (_that) {
case _HomeModel():
return $default(_that.id,_that.title,_that.city,_that.district,_that.imageUrl,_that.price,_that.rating,_that.rooms,_that.bathrooms,_that.description,_that.isAvailable,_that.propertyType,_that.area);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String city,  String district, @JsonKey(name: 'image_url')  String imageUrl,  double price,  double rating,  int rooms,  int bathrooms,  String description, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'property_type')  String propertyType,  double area)?  $default,) {final _that = this;
switch (_that) {
case _HomeModel() when $default != null:
return $default(_that.id,_that.title,_that.city,_that.district,_that.imageUrl,_that.price,_that.rating,_that.rooms,_that.bathrooms,_that.description,_that.isAvailable,_that.propertyType,_that.area);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeModel implements HomeModel {
  const _HomeModel({required this.id, this.title = '', this.city = '', this.district = '', @JsonKey(name: 'image_url') this.imageUrl = '', this.price = 0.0, this.rating = 0.0, this.rooms = 0, this.bathrooms = 0, this.description = '', @JsonKey(name: 'is_available') this.isAvailable = false, @JsonKey(name: 'property_type') this.propertyType = '', this.area = 0.0});
  factory _HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String city;
@override@JsonKey() final  String district;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey() final  double price;
@override@JsonKey() final  double rating;
@override@JsonKey() final  int rooms;
@override@JsonKey() final  int bathrooms;
@override@JsonKey() final  String description;
@override@JsonKey(name: 'is_available') final  bool isAvailable;
@override@JsonKey(name: 'property_type') final  String propertyType;
@override@JsonKey() final  double area;

/// Create a copy of HomeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeModelCopyWith<_HomeModel> get copyWith => __$HomeModelCopyWithImpl<_HomeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.description, description) || other.description == description)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.propertyType, propertyType) || other.propertyType == propertyType)&&(identical(other.area, area) || other.area == area));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,city,district,imageUrl,price,rating,rooms,bathrooms,description,isAvailable,propertyType,area);

@override
String toString() {
  return 'HomeModel(id: $id, title: $title, city: $city, district: $district, imageUrl: $imageUrl, price: $price, rating: $rating, rooms: $rooms, bathrooms: $bathrooms, description: $description, isAvailable: $isAvailable, propertyType: $propertyType, area: $area)';
}


}

/// @nodoc
abstract mixin class _$HomeModelCopyWith<$Res> implements $HomeModelCopyWith<$Res> {
  factory _$HomeModelCopyWith(_HomeModel value, $Res Function(_HomeModel) _then) = __$HomeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String city, String district,@JsonKey(name: 'image_url') String imageUrl, double price, double rating, int rooms, int bathrooms, String description,@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'property_type') String propertyType, double area
});




}
/// @nodoc
class __$HomeModelCopyWithImpl<$Res>
    implements _$HomeModelCopyWith<$Res> {
  __$HomeModelCopyWithImpl(this._self, this._then);

  final _HomeModel _self;
  final $Res Function(_HomeModel) _then;

/// Create a copy of HomeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? city = null,Object? district = null,Object? imageUrl = null,Object? price = null,Object? rating = null,Object? rooms = null,Object? bathrooms = null,Object? description = null,Object? isAvailable = null,Object? propertyType = null,Object? area = null,}) {
  return _then(_HomeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,propertyType: null == propertyType ? _self.propertyType : propertyType // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
