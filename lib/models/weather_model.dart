class WeatherModel {
  final String description;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String icon;
  final String name;

  WeatherModel({
    required this.description,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.icon,
    required this.name,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    return WeatherModel(
        description: data['weather'][0]['description'],
        temp: data['main']['temp'],
        maxTemp: data['main']['temp_max'],
        minTemp: data['main']['temp_min'],
        name: data['name'],
        icon: data['weather'][0]['icon']);
  }
}
