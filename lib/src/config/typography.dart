import 'package:weather_app/exports.dart';

class WeatherTypography {
  WeatherTypography({Size? screenSize}) {
    if (screenSize == null) {
      scale = 1;
      return;
    }
    final shortestSide = screenSize.shortestSide;
    const tabletXl = 1000;
    const tabletLg = 800;
    const tabletSm = 600;
    const phoneLg = 400;
    if (shortestSide > tabletXl) {
      scale = 1.25;
    } else if (shortestSide > tabletLg) {
      scale = 1.15;
    } else if (shortestSide > tabletSm) {
      scale = 1;
    } else if (shortestSide > phoneLg) {
      scale = .9; // phone
    } else {
      scale = .85; // small phone
    }
  }

  late final double scale;

  TextStyle get _openSansFont => GoogleFonts.openSans();

  TextStyle _createFont(
    TextStyle style, {
    required double fontSize,
    double? heightPx,
    double? spacingPc,
    FontWeight? weight,
  }) {
    fontSize *= scale;
    if (heightPx != null) {
      heightPx *= scale;
    }

    return style.copyWith(
      fontSize: fontSize,
      height: heightPx != null ? (heightPx / fontSize) : style.height,
      letterSpacing:
          spacingPc != null ? fontSize * spacingPc * 0.01 : style.letterSpacing,
      fontWeight: weight,
      color: AppColors.white,
    );
  }

  late final TextStyle displayLarge = _createFont(
    _openSansFont,
    fontSize: AppSizes.p48,
    weight: FontWeight.w600,
    
  );

  late final TextStyle displayMedium = _createFont(
    _openSansFont,
    fontSize: AppSizes.p32,
    weight: FontWeight.w600,
  );

  late final TextStyle displaySmall = _createFont(
    _openSansFont,
    fontSize: AppSizes.p24,
    weight: FontWeight.w600,
  );

  late final TextStyle bodyLarge = _createFont(
    _openSansFont,
    fontSize: AppSizes.p20,
    weight: FontWeight.w600,
  );

  late final TextStyle bodyMedium = _createFont(
    _openSansFont,
    fontSize: AppSizes.p18,
    weight: FontWeight.w600,
  );
}
