import 'package:envied/envied.dart';
import 'package:weather_app/src/constants/api_constants.dart';

part 'env.g.dart';

@Envied(path: 'config.env')
abstract class Env {
  @EnviedField(varName: ApiConstants.baseURLKey)
  static const String baseURL = _Env.baseURL;

  @EnviedField(varName: ApiConstants.apiKey)
  static const String weatherApiKey = _Env.weatherApiKey;
}
