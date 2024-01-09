import 'package:weather_app/exports.dart';

final cityProvider = StateProvider<String>((ref) {
  final currentCityLocation = ref.watch(currentLocationFutureProvider).value;
  String? city;
  if (currentCityLocation != city) {
    city = currentCityLocation;
  }
  return city ?? 'Abuja';
});
