import 'package:weather_app/exports.dart';
import 'package:weather_app/src/features/weather/domain/weather_data.dart';
import 'package:weather_app/src/features/weather/domain/weather_response.dart';
import 'package:weather_app/src/features/weather/data/repository/weather_repository_impl.dart';

import 'weather_icon_image.dart';

class CurrentWeather extends ConsumerWidget {
  const CurrentWeather({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherDataAsync = ref.watch(getCurrentWeatherFutureProvider);
    final city = ref.watch(cityProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(city, style: $styles.displayMedium),
        hSizedBox4,
        AsyncValueWidget<WeatherResponse>(
          value: weatherDataAsync,
          data: (data) => CurrentWeatherContents(data: WeatherData.from(data)),
        ),
      ],
    );
  }
}

class CurrentWeatherContents extends ConsumerWidget {
  const CurrentWeatherContents({super.key, required this.data});
  final WeatherData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temp = data.temp.celsius.toInt().toString();
    final minTemp = data.minTemp.celsius.toInt().toString();
    final maxTemp = data.maxTemp.celsius.toInt().toString();
    final highAndLow = 'H:$maxTemp° L:$minTemp°';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WeatherIconImage(icon: data.iconUrl, size: AppSizes.p100),
        Text(temp, style: $styles.displayMedium),
        hSizedBox2,
        Text(highAndLow, style: $styles.bodyMedium),
      ],
    );
  }
}
