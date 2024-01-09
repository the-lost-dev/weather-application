import 'package:weather_app/exports.dart';
import 'package:weather_app/src/features/weather/domain/forecast_weather_data.dart';
import 'package:weather_app/src/features/weather/domain/forecast_weather_response.dart';
import 'package:weather_app/src/features/weather/data/repository/weather_repository_impl.dart';
import 'forecast_weather_contents.dart';

class ForecastWeather extends ConsumerWidget {
  const ForecastWeather({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastDataAsync = ref.watch(getForecastWeatherFutureProvider);
    return AsyncValueWidget<ForecastWeatherResponse>(
      value: forecastDataAsync,
      data: (data) {
        final forecastDays = [0, 8, 16, 24, 32];
        final forecastWeatherData = [
          for (final i in forecastDays) ForecastWeatherData.from(data).list[i]
        ];

        return ForecastWeatherContents(
          forecastWeatherItems: forecastWeatherData,
        );
      },
    );
  }
}
