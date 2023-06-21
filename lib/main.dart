import 'package:flutter/material.dart';
import 'package:fluttertest2/screens/forecast_screen.dart';
import 'package:fluttertest2/screens/weather_screen.dart';
import 'package:provider/provider.dart';
import 'providers/weather_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(
                text: 'Daily',
              ),
              Tab(
                text: 'Upcomming 2 weeks',
              )
            ]),
          ),
          body: const TabBarView(children: [
            WeatherScreen(),
            ForecastScreen(),
          ]),
        ),
      ),
    );
  }
}
