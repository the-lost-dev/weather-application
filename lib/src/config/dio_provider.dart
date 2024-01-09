import 'package:weather_app/exports.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final client = Dio(BaseOptions(
    baseUrl: Env.baseURL,
    contentType: Headers.formUrlEncodedContentType,
    receiveTimeout: AppConstants.defaultNetworkDuration,
    connectTimeout: AppConstants.defaultNetworkDuration,
    sendTimeout: AppConstants.defaultNetworkDuration,
  ));

  return client;
}
