import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/geo_location.dart';
import 'package:weather_app/models.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  Weather? _weather;

  Future<Weather> getCurrentWeather() async {
    String city = 'seoul';
    String apiKey = '5a65e5ac9b7dbbcc1466f9e52e7540fb';
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentWeather().then((weather) {
      setState(() {
        _weather = weather;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
        ],
      ),
      body: Column(
        children: [
          Center(
              child: FutureBuilder<Weather>(
            future: getCurrentWeather(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return weatherBox(_weather!);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          )),
        ],
      ),
    );
  }

  Widget weatherBox(Weather _weather) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${_weather.temp}°C",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_weather.description),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Feels:${_weather.feelsLike}°C"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("H:${_weather.high}°C L:${_weather.low}°C"),
          ),
        ]);
  }
}
