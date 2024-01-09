
import 'package:weather_app/exports.dart';



class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    Widget child = FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        AppStrings.currentLocationWeather,
        style: $styles.displaySmall,
      ),
    );

    if (isLoading) child = const LoadingIndicator();

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.p10),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.p16,
            horizontal: AppSizes.p40,
          ),
        ),
        child: child,
      ),
    );
  }
}
