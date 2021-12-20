import 'package:flutter/material.dart';
import 'package:weather_app/current_weather.dart';
import 'package:weather_app/geo_location.dart';
import 'package:weather_app/screens/loading.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _screen = [
    const Loading(),
    const CurrentWeatherPage(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.thermostat_outlined), label: 'Chef'),
          BottomNavigationBarItem(
              icon: Icon(Icons.air_outlined), label: 'Matt'),
        ],
      ),
    );
  }
}
