import 'package:flutter/material.dart';
import 'package:fluttertest2/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final currentWeather = weatherProvider.currentWeather;

    return Scaffold(
      body: Center(
        child: currentWeather != null
            ? Column(
                children: [
                  Image.network(
                    'https:${currentWeather.condition.icon}',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Weather status image',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Daily',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Temperature: ${currentWeather.tempC}°C',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Humidity: ${currentWeather.humidity}%, ',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Cloud: ${currentWeather.cloud}%, ',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Wind: ${currentWeather.windKph} km/h',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location: ${currentWeather.location.name}',
                              style: const TextStyle(fontSize: 40),
                            ),
                            Text(
                              'Name: ${currentWeather.location.name}',
                              style: const TextStyle(fontSize: 28),
                            ),
                            Text(
                              'Region: ${currentWeather.location.region}',
                              style: const TextStyle(fontSize: 28),
                            ),
                            Text(
                              'Country: ${currentWeather.location.country}',
                              style: const TextStyle(fontSize: 28),
                            ),
                            // Text('Timezone: ${currentWeather.location.tzId}'),
                            Text(
                              'Last Update: ${currentWeather.lastUpdated}',
                              style: const TextStyle(fontSize: 28),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
