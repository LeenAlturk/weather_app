import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherStateName;
  //by factory constructor we can solve nulable problem
  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherStateName});
  factory WeatherModel.fromjson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        //date: data['location']['localtime'],
        date: DateTime.parse(data['current']['last_updated']),
        temp: jsonData['avgtemp_c'],
        maxtemp: jsonData['maxtemp_c'],
        mintemp: jsonData['mintemp_c'],
        weatherStateName: data['current']['condition']['text']);
  }
  @override
  String toString() {
    return 'temp = $temp mintemp = $mintemp  maxtemp = $maxtemp weatherStateName = $weatherStateName';
  }

  String getImage() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Partly cloudy' ||
        weatherStateName == 'Overcast') {
      return 'images/clouds (1).png';
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return 'images/snow.png';
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return 'images/mist.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	' ||
        weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Light rain') {
      return 'images/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return 'images/thunderstorm.png';
    } else if (weatherStateName == 'Sunny') {
      return 'images/clear.png';
    } else {
      return 'images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy' ||
        weatherStateName == 'Overcast') {
      return Colors.blue;
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Light rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Moderate rain') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else if (weatherStateName == 'Sunny') {
      return Colors.orange;
    } else {
      return Colors.orange;
    }
  }
}
