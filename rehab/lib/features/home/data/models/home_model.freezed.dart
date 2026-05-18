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

 int get id; String get titleAr; String get titleEn; String get cityAr; String get cityEn; String get districtAr; String get districtEn; String get descriptionAr; String get descriptionEn; String get propertyTypeAr; String get propertyTypeEn; List<String> get policyAr; List<String> get policyEn; List<String> get amenitiesAr; List<String> get amenitiesEn; String get imageUrl; List<String> get imageUrls; double get price; double get rating; int get rooms; int get bathrooms; bool get isAvailable; double get area; double get lat; double get lng; double get distance;
/// Create a copy of HomeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeModelCopyWith<HomeModel> get copyWith => _$HomeModelCopyWithImpl<HomeModel>(this as HomeModel, _$identity);

  /// Serializes this HomeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titleAr, titleAr) || other.titleAr == titleAr)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.cityAr, cityAr) || other.cityAr == cityAr)&&(identical(other.cityEn, cityEn) || other.cityEn == cityEn)&&(identical(other.districtAr, districtAr) || other.districtAr == districtAr)&&(identical(other.districtEn, districtEn) || other.districtEn == districtEn)&&(identical(other.descriptionAr, descriptionAr) || other.descriptionAr == descriptionAr)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.propertyTypeAr, propertyTypeAr) || other.propertyTypeAr == propertyTypeAr)&&(identical(other.propertyTypeEn, propertyTypeEn) || other.propertyTypeEn == propertyTypeEn)&&const DeepCollectionEquality().equals(other.policyAr, policyAr)&&const DeepCollectionEquality().equals(other.policyEn, policyEn)&&const DeepCollectionEquality().equals(other.amenitiesAr, amenitiesAr)&&const DeepCollectionEquality().equals(other.amenitiesEn, amenitiesEn)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.area, area) || other.area == area)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,titleAr,titleEn,cityAr,cityEn,districtAr,districtEn,descriptionAr,descriptionEn,propertyTypeAr,propertyTypeEn,const DeepCollectionEquality().hash(policyAr),const DeepCollectionEquality().hash(policyEn),const DeepCollectionEquality().hash(amenitiesAr),const DeepCollectionEquality().hash(amenitiesEn),imageUrl,const DeepCollectionEquality().hash(imageUrls),price,rating,rooms,bathrooms,isAvailable,area,lat,lng,distance]);

@override
String toString() {
  return 'HomeModel(id: $id, titleAr: $titleAr, titleEn: $titleEn, cityAr: $cityAr, cityEn: $cityEn, districtAr: $districtAr, districtEn: $districtEn, descriptionAr: $descriptionAr, descriptionEn: $descriptionEn, propertyTypeAr: $propertyTypeAr, propertyTypeEn: $propertyTypeEn, policyAr: $policyAr, policyEn: $policyEn, amenitiesAr: $amenitiesAr, amenitiesEn: $amenitiesEn, imageUrl: $imageUrl, imageUrls: $imageUrls, price: $price, rating: $rating, rooms: $rooms, bathrooms: $bathrooms, isAvailable: $isAvailable, area: $area, lat: $lat, lng: $lng, distance: $distance)';
}


}

/// @nodoc
abstract mixin class $HomeModelCopyWith<$Res>  {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) _then) = _$HomeModelCopyWithImpl;
@useResult
$Res call({
 int id, String titleAr, String titleEn, String cityAr, String cityEn, String districtAr, String districtEn, String descriptionAr, String descriptionEn, String propertyTypeAr, String propertyTypeEn, List<String> policyAr, List<String> policyEn, List<String> amenitiesAr, List<String> amenitiesEn, String imageUrl, List<String> imageUrls, double price, double rating, int rooms, int bathrooms, bool isAvailable, double area, double lat, double lng, double distance
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titleAr = null,Object? titleEn = null,Object? cityAr = null,Object? cityEn = null,Object? districtAr = null,Object? districtEn = null,Object? descriptionAr = null,Object? descriptionEn = null,Object? propertyTypeAr = null,Object? propertyTypeEn = null,Object? policyAr = null,Object? policyEn = null,Object? amenitiesAr = null,Object? amenitiesEn = null,Object? imageUrl = null,Object? imageUrls = null,Object? price = null,Object? rating = null,Object? rooms = null,Object? bathrooms = null,Object? isAvailable = null,Object? area = null,Object? lat = null,Object? lng = null,Object? distance = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,titleAr: null == titleAr ? _self.titleAr : titleAr // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,cityAr: null == cityAr ? _self.cityAr : cityAr // ignore: cast_nullable_to_non_nullable
as String,cityEn: null == cityEn ? _self.cityEn : cityEn // ignore: cast_nullable_to_non_nullable
as String,districtAr: null == districtAr ? _self.districtAr : districtAr // ignore: cast_nullable_to_non_nullable
as String,districtEn: null == districtEn ? _self.districtEn : districtEn // ignore: cast_nullable_to_non_nullable
as String,descriptionAr: null == descriptionAr ? _self.descriptionAr : descriptionAr // ignore: cast_nullable_to_non_nullable
as String,descriptionEn: null == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String,propertyTypeAr: null == propertyTypeAr ? _self.propertyTypeAr : propertyTypeAr // ignore: cast_nullable_to_non_nullable
as String,propertyTypeEn: null == propertyTypeEn ? _self.propertyTypeEn : propertyTypeEn // ignore: cast_nullable_to_non_nullable
as String,policyAr: null == policyAr ? _self.policyAr : policyAr // ignore: cast_nullable_to_non_nullable
as List<String>,policyEn: null == policyEn ? _self.policyEn : policyEn // ignore: cast_nullable_to_non_nullable
as List<String>,amenitiesAr: null == amenitiesAr ? _self.amenitiesAr : amenitiesAr // ignore: cast_nullable_to_non_nullable
as List<String>,amenitiesEn: null == amenitiesEn ? _self.amenitiesEn : amenitiesEn // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String titleAr,  String titleEn,  String cityAr,  String cityEn,  String districtAr,  String districtEn,  String descriptionAr,  String descriptionEn,  String propertyTypeAr,  String propertyTypeEn,  List<String> policyAr,  List<String> policyEn,  List<String> amenitiesAr,  List<String> amenitiesEn,  String imageUrl,  List<String> imageUrls,  double price,  double rating,  int rooms,  int bathrooms,  bool isAvailable,  double area,  double lat,  double lng,  double distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeModel() when $default != null:
return $default(_that.id,_that.titleAr,_that.titleEn,_that.cityAr,_that.cityEn,_that.districtAr,_that.districtEn,_that.descriptionAr,_that.descriptionEn,_that.propertyTypeAr,_that.propertyTypeEn,_that.policyAr,_that.policyEn,_that.amenitiesAr,_that.amenitiesEn,_that.imageUrl,_that.imageUrls,_that.price,_that.rating,_that.rooms,_that.bathrooms,_that.isAvailable,_that.area,_that.lat,_that.lng,_that.distance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String titleAr,  String titleEn,  String cityAr,  String cityEn,  String districtAr,  String districtEn,  String descriptionAr,  String descriptionEn,  String propertyTypeAr,  String propertyTypeEn,  List<String> policyAr,  List<String> policyEn,  List<String> amenitiesAr,  List<String> amenitiesEn,  String imageUrl,  List<String> imageUrls,  double price,  double rating,  int rooms,  int bathrooms,  bool isAvailable,  double area,  double lat,  double lng,  double distance)  $default,) {final _that = this;
switch (_that) {
case _HomeModel():
return $default(_that.id,_that.titleAr,_that.titleEn,_that.cityAr,_that.cityEn,_that.districtAr,_that.districtEn,_that.descriptionAr,_that.descriptionEn,_that.propertyTypeAr,_that.propertyTypeEn,_that.policyAr,_that.policyEn,_that.amenitiesAr,_that.amenitiesEn,_that.imageUrl,_that.imageUrls,_that.price,_that.rating,_that.rooms,_that.bathrooms,_that.isAvailable,_that.area,_that.lat,_that.lng,_that.distance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String titleAr,  String titleEn,  String cityAr,  String cityEn,  String districtAr,  String districtEn,  String descriptionAr,  String descriptionEn,  String propertyTypeAr,  String propertyTypeEn,  List<String> policyAr,  List<String> policyEn,  List<String> amenitiesAr,  List<String> amenitiesEn,  String imageUrl,  List<String> imageUrls,  double price,  double rating,  int rooms,  int bathrooms,  bool isAvailable,  double area,  double lat,  double lng,  double distance)?  $default,) {final _that = this;
switch (_that) {
case _HomeModel() when $default != null:
return $default(_that.id,_that.titleAr,_that.titleEn,_that.cityAr,_that.cityEn,_that.districtAr,_that.districtEn,_that.descriptionAr,_that.descriptionEn,_that.propertyTypeAr,_that.propertyTypeEn,_that.policyAr,_that.policyEn,_that.amenitiesAr,_that.amenitiesEn,_that.imageUrl,_that.imageUrls,_that.price,_that.rating,_that.rooms,_that.bathrooms,_that.isAvailable,_that.area,_that.lat,_that.lng,_that.distance);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _HomeModel implements HomeModel {
  const _HomeModel({required this.id, this.titleAr = '', this.titleEn = '', this.cityAr = '', this.cityEn = '', this.districtAr = '', this.districtEn = '', this.descriptionAr = '', this.descriptionEn = '', this.propertyTypeAr = '', this.propertyTypeEn = '', final  List<String> policyAr = const [], final  List<String> policyEn = const [], final  List<String> amenitiesAr = const [], final  List<String> amenitiesEn = const [], this.imageUrl = '', final  List<String> imageUrls = const [], this.price = 0.0, this.rating = 0.0, this.rooms = 0, this.bathrooms = 0, this.isAvailable = true, this.area = 0.0, this.lat = 0.0, this.lng = 0.0, this.distance = 0.0}): _policyAr = policyAr,_policyEn = policyEn,_amenitiesAr = amenitiesAr,_amenitiesEn = amenitiesEn,_imageUrls = imageUrls;
  factory _HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String titleAr;
@override@JsonKey() final  String titleEn;
@override@JsonKey() final  String cityAr;
@override@JsonKey() final  String cityEn;
@override@JsonKey() final  String districtAr;
@override@JsonKey() final  String districtEn;
@override@JsonKey() final  String descriptionAr;
@override@JsonKey() final  String descriptionEn;
@override@JsonKey() final  String propertyTypeAr;
@override@JsonKey() final  String propertyTypeEn;
 final  List<String> _policyAr;
@override@JsonKey() List<String> get policyAr {
  if (_policyAr is EqualUnmodifiableListView) return _policyAr;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_policyAr);
}

 final  List<String> _policyEn;
@override@JsonKey() List<String> get policyEn {
  if (_policyEn is EqualUnmodifiableListView) return _policyEn;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_policyEn);
}

 final  List<String> _amenitiesAr;
@override@JsonKey() List<String> get amenitiesAr {
  if (_amenitiesAr is EqualUnmodifiableListView) return _amenitiesAr;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_amenitiesAr);
}

 final  List<String> _amenitiesEn;
@override@JsonKey() List<String> get amenitiesEn {
  if (_amenitiesEn is EqualUnmodifiableListView) return _amenitiesEn;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_amenitiesEn);
}

@override@JsonKey() final  String imageUrl;
 final  List<String> _imageUrls;
@override@JsonKey() List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

@override@JsonKey() final  double price;
@override@JsonKey() final  double rating;
@override@JsonKey() final  int rooms;
@override@JsonKey() final  int bathrooms;
@override@JsonKey() final  bool isAvailable;
@override@JsonKey() final  double area;
@override@JsonKey() final  double lat;
@override@JsonKey() final  double lng;
@override@JsonKey() final  double distance;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titleAr, titleAr) || other.titleAr == titleAr)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.cityAr, cityAr) || other.cityAr == cityAr)&&(identical(other.cityEn, cityEn) || other.cityEn == cityEn)&&(identical(other.districtAr, districtAr) || other.districtAr == districtAr)&&(identical(other.districtEn, districtEn) || other.districtEn == districtEn)&&(identical(other.descriptionAr, descriptionAr) || other.descriptionAr == descriptionAr)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.propertyTypeAr, propertyTypeAr) || other.propertyTypeAr == propertyTypeAr)&&(identical(other.propertyTypeEn, propertyTypeEn) || other.propertyTypeEn == propertyTypeEn)&&const DeepCollectionEquality().equals(other._policyAr, _policyAr)&&const DeepCollectionEquality().equals(other._policyEn, _policyEn)&&const DeepCollectionEquality().equals(other._amenitiesAr, _amenitiesAr)&&const DeepCollectionEquality().equals(other._amenitiesEn, _amenitiesEn)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.area, area) || other.area == area)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,titleAr,titleEn,cityAr,cityEn,districtAr,districtEn,descriptionAr,descriptionEn,propertyTypeAr,propertyTypeEn,const DeepCollectionEquality().hash(_policyAr),const DeepCollectionEquality().hash(_policyEn),const DeepCollectionEquality().hash(_amenitiesAr),const DeepCollectionEquality().hash(_amenitiesEn),imageUrl,const DeepCollectionEquality().hash(_imageUrls),price,rating,rooms,bathrooms,isAvailable,area,lat,lng,distance]);

@override
String toString() {
  return 'HomeModel(id: $id, titleAr: $titleAr, titleEn: $titleEn, cityAr: $cityAr, cityEn: $cityEn, districtAr: $districtAr, districtEn: $districtEn, descriptionAr: $descriptionAr, descriptionEn: $descriptionEn, propertyTypeAr: $propertyTypeAr, propertyTypeEn: $propertyTypeEn, policyAr: $policyAr, policyEn: $policyEn, amenitiesAr: $amenitiesAr, amenitiesEn: $amenitiesEn, imageUrl: $imageUrl, imageUrls: $imageUrls, price: $price, rating: $rating, rooms: $rooms, bathrooms: $bathrooms, isAvailable: $isAvailable, area: $area, lat: $lat, lng: $lng, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$HomeModelCopyWith<$Res> implements $HomeModelCopyWith<$Res> {
  factory _$HomeModelCopyWith(_HomeModel value, $Res Function(_HomeModel) _then) = __$HomeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String titleAr, String titleEn, String cityAr, String cityEn, String districtAr, String districtEn, String descriptionAr, String descriptionEn, String propertyTypeAr, String propertyTypeEn, List<String> policyAr, List<String> policyEn, List<String> amenitiesAr, List<String> amenitiesEn, String imageUrl, List<String> imageUrls, double price, double rating, int rooms, int bathrooms, bool isAvailable, double area, double lat, double lng, double distance
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titleAr = null,Object? titleEn = null,Object? cityAr = null,Object? cityEn = null,Object? districtAr = null,Object? districtEn = null,Object? descriptionAr = null,Object? descriptionEn = null,Object? propertyTypeAr = null,Object? propertyTypeEn = null,Object? policyAr = null,Object? policyEn = null,Object? amenitiesAr = null,Object? amenitiesEn = null,Object? imageUrl = null,Object? imageUrls = null,Object? price = null,Object? rating = null,Object? rooms = null,Object? bathrooms = null,Object? isAvailable = null,Object? area = null,Object? lat = null,Object? lng = null,Object? distance = null,}) {
  return _then(_HomeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,titleAr: null == titleAr ? _self.titleAr : titleAr // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,cityAr: null == cityAr ? _self.cityAr : cityAr // ignore: cast_nullable_to_non_nullable
as String,cityEn: null == cityEn ? _self.cityEn : cityEn // ignore: cast_nullable_to_non_nullable
as String,districtAr: null == districtAr ? _self.districtAr : districtAr // ignore: cast_nullable_to_non_nullable
as String,districtEn: null == districtEn ? _self.districtEn : districtEn // ignore: cast_nullable_to_non_nullable
as String,descriptionAr: null == descriptionAr ? _self.descriptionAr : descriptionAr // ignore: cast_nullable_to_non_nullable
as String,descriptionEn: null == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String,propertyTypeAr: null == propertyTypeAr ? _self.propertyTypeAr : propertyTypeAr // ignore: cast_nullable_to_non_nullable
as String,propertyTypeEn: null == propertyTypeEn ? _self.propertyTypeEn : propertyTypeEn // ignore: cast_nullable_to_non_nullable
as String,policyAr: null == policyAr ? _self._policyAr : policyAr // ignore: cast_nullable_to_non_nullable
as List<String>,policyEn: null == policyEn ? _self._policyEn : policyEn // ignore: cast_nullable_to_non_nullable
as List<String>,amenitiesAr: null == amenitiesAr ? _self._amenitiesAr : amenitiesAr // ignore: cast_nullable_to_non_nullable
as List<String>,amenitiesEn: null == amenitiesEn ? _self._amenitiesEn : amenitiesEn // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
