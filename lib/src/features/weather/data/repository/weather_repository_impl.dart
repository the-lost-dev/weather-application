import 'package:weather_app/exports.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/src/features/weather/data/api/weather_api.dart';
import 'package:weather_app/src/features/weather/domain/forecast_weather_response.dart';
import 'package:weather_app/src/features/weather/domain/weather_response.dart';

import 'weather_repository.dart';

part 'weather_repository_impl.g.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl({required this.weatherApi});

  final WeatherApi weatherApi;

  @override
  Future<WeatherResponse> getCurrentWeather({
    required String city,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await weatherApi.getCurrentWeatherData(
        city,
        ApiConstants.units,
        Env.weatherApiKey,
      );
      return response;
    } catch (error) {
      throw AppException.fromError(error);
    }
  }

  @override
  Future<ForecastWeatherResponse> getForecastWeather({
    required String city,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await weatherApi.getForecastWeatherData(
        city,
        ApiConstants.units,
        Env.weatherApiKey,
      );
      return response;
    } catch (error) {
      throw AppException.fromError(error);
    }
  }
}

@riverpod
WeatherRepository weatherRepository(WeatherRepositoryRef ref) {
  return WeatherRepositoryImpl(weatherApi: ref.watch(weatherApiProvider));
}

@riverpod
Future<WeatherResponse> getCurrentWeatherFuture(
  GetCurrentWeatherFutureRef ref,
) async {
  final cancelToken = ref.cancelToken();
  final city = ref.watch(cityProvider);
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  final response = await weatherRepository.getCurrentWeather(
    city: city,
    cancelToken: cancelToken,
  );
  return response;
}

@riverpod
Future<ForecastWeatherResponse> getForecastWeatherFuture(
  GetForecastWeatherFutureRef ref,
) async {
  final cancelToken = ref.cancelToken();
  final city = ref.watch(cityProvider);
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  final response = await weatherRepository.getForecastWeather(
    city: city,
    cancelToken: cancelToken,
  );
  return response;
}
