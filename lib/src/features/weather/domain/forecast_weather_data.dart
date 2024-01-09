import 'forecast_weather_response.dart';
import 'weather_data.dart';

class ForecastWeatherData {
  const ForecastWeatherData({
    required this.list,
  });

  final List<WeatherData> list;

  factory ForecastWeatherData.from(
    ForecastWeatherResponse forecastWeatherResponse,
  ) {
    return ForecastWeatherData(
      list: forecastWeatherResponse.list
          .map((data) => WeatherData.from(data))
          .toList(),
    );
  }
}
