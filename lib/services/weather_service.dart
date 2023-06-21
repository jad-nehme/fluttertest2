import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/location.dart';
import '../models/current_weather.dart';

class WeatherService {
  static const String baseUrl = 'https://api.weatherapi.com/v1';
  static const String apiKey = '788b52b65a33444b83c60354232106';

  Future<CurrentWeather> fetchCurrentWeather(
      double latitude, double longitude) async {
    final url =
        Uri.parse('$baseUrl/current.json?key=$apiKey&q=$latitude,$longitude');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final locationJson = jsonBody['location'];
      final currentJson = jsonBody['current'];

      final location = Location(
        name: locationJson['name'],
        region: locationJson['region'],
        country: locationJson['country'],
        latitude: locationJson['lat'],
        longitude: locationJson['lon'],
        timezoneId: locationJson['tz_id'],
        localtimeEpoch: locationJson['localtime_epoch'],
        localtime: locationJson['localtime'],
      );

      final currentWeather = CurrentWeather(
        location: location,
        lastUpdatedEpoch: currentJson['last_updated_epoch'],
        lastUpdated: currentJson['last_updated'],
        tempC: currentJson['temp_c'],
        tempF: currentJson['temp_f'],
        isDay: currentJson['is_day'] == 1,
        condition: WeatherCondition(
          text: currentJson['condition']['text'],
          icon: currentJson['condition']['icon'],
          code: currentJson['condition']['code'],
        ),
        windMph: currentJson['wind_mph'],
        windKph: currentJson['wind_kph'],
        windDegree: currentJson['wind_degree'],
        windDirection: currentJson['wind_dir'],
        pressureMb: currentJson['pressure_mb'],
        pressureIn: currentJson['pressure_in'],
        precipMm: currentJson['precip_mm'],
        precipIn: currentJson['precip_in'],
        humidity: currentJson['humidity'],
        cloud: currentJson['cloud'],
        feelsLikeC: currentJson['feelslike_c'],
        feelsLikeF: currentJson['feelslike_f'],
        visibilityKm: currentJson['vis_km'],
        visibilityMiles: currentJson['vis_miles'],
        uv: currentJson['uv'],
        gustMph: currentJson['gust_mph'],
        gustKph: currentJson['gust_kph'],
      );

      return currentWeather;
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
}
