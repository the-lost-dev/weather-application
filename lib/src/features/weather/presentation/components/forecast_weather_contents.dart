import 'package:weather_app/exports.dart';
import 'package:weather_app/src/features/weather/domain/weather_data.dart';

import 'forecast_weather_widget.dart';

class ForecastWeatherContents extends StatelessWidget {
  const ForecastWeatherContents({
    super.key,
    required this.forecastWeatherItems,
  });

  final List<WeatherData> forecastWeatherItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: forecastWeatherItems
          .map((data) => ForecastWeatherWidget(data: data))
          .toList(),
    );
  }
}
