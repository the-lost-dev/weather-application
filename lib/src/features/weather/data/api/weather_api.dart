import 'package:weather_app/exports.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/src/features/weather/domain/weather_response.dart';
import 'package:weather_app/src/features/weather/domain/forecast_weather_response.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: Env.baseURL)
abstract class WeatherApi {
  factory WeatherApi(Dio dio) = _WeatherApi;

  @GET(ApiConstants.currentWeatherEndpoint)
  Future<WeatherResponse> getCurrentWeatherData(
    @Query(ApiConstants.cityQueryKey) String city,
    @Query(ApiConstants.unitsQueryKey) String unit,
    @Query(ApiConstants.apiQueryKey) String apiKey,
  );

  @GET(ApiConstants.forecastWeatherEndpoint)
  Future<ForecastWeatherResponse> getForecastWeatherData(
    @Query(ApiConstants.cityQueryKey) String city,
    @Query(ApiConstants.unitsQueryKey) String unit,
    @Query(ApiConstants.apiQueryKey) String apiKey,
  );
}

@riverpod
WeatherApi weatherApi(WeatherApiRef ref) {
  final dio = ref.watch(dioProvider);
  return WeatherApi(dio);
}
