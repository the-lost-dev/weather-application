import 'package:weather_app/exports.dart';

import 'components/city_search_box.dart';
import 'components/current_location_button.dart';
import 'components/current_weather.dart';
import 'components/forecast_weather.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocationAsync = ref.watch(currentLocationFutureProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.kPadding),
          child: AsyncValueWidget(
            value: currentLocationAsync,
            data: (data) => const WeatherBody(),
          ),
        ),
      ),
    );
  }
}

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Spacer(),
        CitySearchBox(),
        Spacer(),
        CurrentWeather(),
        Spacer(),
        ForecastWeather(),
        Spacer(),
        CurrentLocationButton(),
      ],
    );
  }
}
