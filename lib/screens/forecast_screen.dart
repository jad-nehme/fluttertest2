import 'package:flutter/material.dart';
import 'package:fluttertest2/data/forecast_data.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: forecastData.length,
        itemBuilder: (BuildContext context, int index) {
          final forecast = forecastData[index];
          return ListTile(
            title: Text(forecast['time'].toString()),
            subtitle: Text('${forecast['temp_c']}°C'),
          );
        },
      ),
    );
  }
}
