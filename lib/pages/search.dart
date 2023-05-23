import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/services/weather_services.dart';
import 'package:weather_app/providers/weather_provider.dart';

class Search extends StatelessWidget {
  Search({this.UpdateUi});

  String? CityName;

  VoidCallback? UpdateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search A City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (data) async {
              CityName = data;
              WedgetService service = WedgetService();
              WeatherModel? weather =
                  await service.getweather(CityNmae: CityName!);
              Provider.of<WeatherProvide>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvide>(context, listen: false).cityName =
                  CityName;
              //weatherData = weather;
              //UpdateUi!();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                label: Text("Search"),
                hintText: "Enter a City",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search)),
          ),
        ),
      ),
    );
  }
}

//WeatherModel? weatherData;
