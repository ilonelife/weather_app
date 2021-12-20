import 'package:flutter/material.dart';
import 'package:weather_app/geo_location.dart';
import 'package:weather_app/main_screen.dart';
import 'package:weather_app/screens/loading.dart';

import 'current_weather.dart';
import 'data_service.dart';
import 'models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Loading(), // MainScreen(),
    );
  }
}