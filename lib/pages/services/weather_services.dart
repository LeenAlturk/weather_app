import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WedgetService {
  Future<WeatherModel?> getweather({required String CityNmae}) async {
    WeatherModel? weather;
    try {
      //maybe have changed here
      String BaseUrl = 'http://api.weatherapi.com/v1';
      String ApiKey = '6a553752fb2a4efdaf3185712232603';
      Uri url =
          Uri.parse('$BaseUrl/forecast.json?key=$ApiKey&q=$CityNmae&days=1');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromjson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
