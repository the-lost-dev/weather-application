import 'temperarure.dart';
import 'weather_response.dart';

class WeatherData {
  const WeatherData({
    required this.weatherConditionCode,
    required this.main,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
    required this.date,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherData.from(WeatherResponse weatherResponse) {
    return WeatherData(
      weatherConditionCode: weatherResponse.weather[0].id,
      main: weatherResponse.weather[0].main,
      temp: Temperature.celsius(weatherResponse.main.temp),
      minTemp: Temperature.celsius(weatherResponse.main.temp_min),
      maxTemp: Temperature.celsius(weatherResponse.main.temp_max),
      description: weatherResponse.weather[0].description,
      date: DateTime.fromMillisecondsSinceEpoch(weatherResponse.dt * 1000),
      icon: weatherResponse.weather[0].icon,
      humidity: weatherResponse.main.humidity,
      windSpeed: weatherResponse.wind.speed,
    );
  }

  final Temperature temp;
  final int weatherConditionCode;
  final String main;
  final Temperature minTemp;
  final Temperature maxTemp;
  final String description;
  final DateTime date;
  final int humidity;
  final double windSpeed;
  final String icon;

  String get iconUrl => 'https://openweathermap.org/img/wn/$icon@2x.png';
}
