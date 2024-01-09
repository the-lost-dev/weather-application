import 'package:weather_app/exports.dart';

import 'temp_params.dart';
import 'weather_info.dart';
import 'wind_param.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  const WeatherResponse({
    required this.main,
    required this.weather,
    required this.wind,
    required this.dt,
  });

  final TempParams main;
  final List<WeatherInfo> weather;
  final WindParam wind;
  final int dt;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);

  @override
  String toString() {
    return 'WeatherResponse(main: $main, weather: $weather, wind: $wind, dt: $dt)';
  }
}
