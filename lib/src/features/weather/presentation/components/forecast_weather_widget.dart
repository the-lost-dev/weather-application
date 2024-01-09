import 'package:intl/intl.dart';
import 'package:weather_app/exports.dart';
import 'package:weather_app/src/features/weather/domain/weather_data.dart';

import 'weather_icon_image.dart';

class ForecastWeatherWidget extends ConsumerWidget {
  const ForecastWeatherWidget({super.key, required this.data});
  final WeatherData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temp = data.temp.celsius.toInt().toString();
    return Expanded(
      child: Column(
        children: [
          Text(
            DateFormat.E().format(data.date),
            style: $styles.bodyMedium,
          ),
          addVerticalSpace(AppSizes.p8),
          WeatherIconImage(icon: data.iconUrl, size: AppSizes.p40),
          addVerticalSpace(AppSizes.p8),
          Text('$temp°', style: $styles.bodyLarge),
        ],
      ),
    );
  }
}
