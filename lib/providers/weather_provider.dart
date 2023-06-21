import 'package:flutter/foundation.dart';
import '../models/current_weather.dart';
import '../services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  CurrentWeather? _currentWeather;
  final WeatherService _weatherService = WeatherService();

  CurrentWeather? get currentWeather => _currentWeather;

  WeatherProvider() {
    fetchCurrentWeather(34.02139053920694, 35.647088393446026);
  }

  Future<void> fetchCurrentWeather(double latitude, double longitude) async {
    try {
      _currentWeather =
          await _weatherService.fetchCurrentWeather(latitude, longitude);
      notifyListeners();
    } catch (e) {
      // Handle error
    }
  }
}
