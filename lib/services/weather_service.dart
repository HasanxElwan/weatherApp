// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData;
    try {
      Uri url = Uri.parse(
          '$baseUrl/weather?appid=7d37f3eb2e42e8f64e60e49da621f4f3&units=metric&q=$cityName');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weatherData = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weatherData;
  }
}
