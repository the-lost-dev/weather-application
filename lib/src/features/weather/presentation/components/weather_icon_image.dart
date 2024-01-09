import 'package:weather_app/exports.dart';

class WeatherIconImage extends StatelessWidget {
  const WeatherIconImage({super.key, required this.icon, required this.size});

  final String icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: icon,
      width: size,
      height: size,
    );
  }
}
