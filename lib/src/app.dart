import 'package:weather_app/exports.dart';

class WeatherApp extends ConsumerWidget {
  const WeatherApp({super.key});

  static WeatherTypography get textTheme => _textTheme;
  static WeatherTypography _textTheme = WeatherTypography();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig().init(context);
    final router = ref.watch(goRouterProvider);
    _textTheme = WeatherTypography(screenSize: context.sizePx);
    return MaterialApp.router(
      routerConfig: router,
      title: AppStrings.weatherApp,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.black),
      debugShowCheckedModeBanner: false,
    );
  }
}

WeatherTypography get $styles => WeatherApp.textTheme;
