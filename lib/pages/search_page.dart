// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          backgroundColor: Color(0xffB8C8D5),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/welcome.jpg'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 120),
            child: TextField(
              onChanged: (data) {
                cityName = data;
              },
              onSubmitted: (data) async {
                cityName = data;
                WeatherService service = WeatherService();
                WeatherModel? weather =
                    await service.getWeather(cityName: cityName!);
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weather;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: GestureDetector(
                        onTap: () async {
                          WeatherService service = WeatherService();
                          WeatherModel? weather =
                              await service.getWeather(cityName: cityName!);
                          Provider.of<WeatherProvider>(context, listen: false)
                              .weatherData = weather;
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.search)),
                  ),
                  hintText: 'Enter your city',
                  label: const Text('Enter to Search'),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20)),
            ),
          ),
        ));
  }
}
