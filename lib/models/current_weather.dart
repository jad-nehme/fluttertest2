import 'package:fluttertest2/models/location.dart';

class CurrentWeather {
  final Location location;
  final num lastUpdatedEpoch;
  final String lastUpdated;
  final num tempC;
  final num tempF;
  final bool isDay;
  final WeatherCondition condition;
  final num windMph;
  final num windKph;
  final num windDegree;
  final String windDirection;
  final num pressureMb;
  final num pressureIn;
  final num precipMm;
  final num precipIn;
  final num humidity;
  final num cloud;
  final num feelsLikeC;
  final num feelsLikeF;
  final num visibilityKm;
  final num visibilityMiles;
  final num uv;
  final num gustMph;
  final num gustKph;

  CurrentWeather({
    required this.location,
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDirection,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.visibilityKm,
    required this.visibilityMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });
}

class WeatherCondition {
  final String text;
  final String icon;
  final num code;

  WeatherCondition({
    required this.text,
    required this.icon,
    required this.code,
  });
}
