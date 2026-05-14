import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final int id;
  final String title;
  final String city;
  final String district;
  final String imageUrl;
  final double price;
  final double rating;
  final int rooms;
  final int bathrooms;
  final String description;
  final bool isAvailable;
  final String propertyType;
  final double area;

  const HomeEntity({
    required this.id,
    required this.title,
    required this.city,
    required this.district,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.rooms,
    required this.bathrooms,
    required this.description,
    required this.isAvailable,
    required this.propertyType,
    required this.area,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    city,
    district,
    imageUrl,
    price,
    rating,
    rooms,
    bathrooms,
    description,
    isAvailable,
    propertyType,
    area,
  ];
}
