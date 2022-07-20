// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData =
        Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB8C8D5),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text('Weather App'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/welcome.jpg'),
                fit: BoxFit.cover)),
        child: Provider.of<WeatherProvider>(context).weatherData == null
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'There is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    Text(
                      weatherData!.name,
                      style: const TextStyle(
                        fontSize: 40,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${weatherData.temp.toInt()}',
                          style: const TextStyle(fontSize: 30),
                        ),
                        const Text(
                          '°C',
                        ),
                        Image.network(
                          'http://openweathermap.org/img/wn/${weatherData.icon}@2x.png',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('MaxTemp : ${weatherData.maxTemp.toInt()}'),
                        const SizedBox(width: 60),
                        Text('MinTemp : ${weatherData.minTemp.toInt()}'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      weatherData.description,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
