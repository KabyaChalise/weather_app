import 'package:flutter/foundation.dart';

@immutable
class FamousCitiesModel {
  final String name;
  final double lat;
  final double log;

  FamousCitiesModel({required this.lat, required this.log, required this.name});
}

List<FamousCitiesModel> famousCities = [
  // Nepal
  FamousCitiesModel(
    lat: 27.7172,
    log: 85.3240,
    name: 'Kathmandu',
  ),
  
  FamousCitiesModel(
    lat: 27.6801,
    log: 83.4323,
    name: 'Lumbini',
  ),
  FamousCitiesModel(
    lat: 28.5363,
    log: 81.2065,
    name: 'Nepalgunj',
  ),

  // India
  FamousCitiesModel(
    lat: 28.7041,
    log: 77.1025,
    name: 'New Delhi',
  ),
  FamousCitiesModel(
    lat: 19.0760,
    log: 72.8777,
    name: 'Mumbai',
  ),
  FamousCitiesModel(
    lat: 12.9716,
    log: 77.5946,
    name: 'Bangalore',
  ),

  // China
  FamousCitiesModel(
    lat: 39.9042,
    log: 116.4074,
    name: 'Beijing',
  ),
  FamousCitiesModel(
    lat: 22.5431,
    log: 114.0579,
    name: 'Hong Kong',
  ),

  // Australia
  FamousCitiesModel(
    lat: -33.8688,
    log: 151.2093,
    name: 'Sydney',
  ),
  // USA
  FamousCitiesModel(
    lat: 34.0522,
    log: -118.2437,
    name: 'Los Angeles',
  ),

  // Canada
  FamousCitiesModel(
    lat: 43.65107,
    log: -79.347015,
    name: 'Toronto',
  ),
  FamousCitiesModel(
    lat: 45.4215,
    log: -75.6919,
    name: 'Ottawa',
  ),
];
