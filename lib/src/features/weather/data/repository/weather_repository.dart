import 'package:weather_app/exports.dart';
import 'package:weather_app/src/features/weather/domain/weather_response.dart';
import 'package:weather_app/src/features/weather/domain/forecast_weather_response.dart';

abstract class WeatherRepository {
  Future<WeatherResponse> getCurrentWeather({
    required String city,
    CancelToken? cancelToken,
  });

  Future<ForecastWeatherResponse> getForecastWeather({
    required String city,
    CancelToken? cancelToken,
  });
}
