import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:geolocator/geolocator.dart';

class LocationData {
  double latitude;
  double longitude;

  LocationData({required this.latitude, required this.longitude});

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}

class LocationHelper {
  static Future<LocationData> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return LocationData(
        latitude: position.latitude, longitude: position.longitude);
  }

  static Future<void> saveLocationToFile(LocationData locationData) async {
    File file = File('location.dart');
    Map<String, dynamic> jsonData = locationData.toJson();
    String jsonString = jsonEncode(jsonData);
    await file.writeAsString(jsonString);
  }

  static Future<LocationData?> readLocationFromFile() async {
    File file = File('location.dart');
    if (await file.exists()) {
      String jsonString = await file.readAsString();
      Map<String, dynamic> jsonData = jsonDecode(jsonString);
      return LocationData.fromJson(jsonData);
    } else {
      return null;
    }
  }
}

