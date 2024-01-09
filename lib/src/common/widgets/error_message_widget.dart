import 'package:weather_app/exports.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key, required this.errorMsg});

  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMsg,
        textAlign: TextAlign.center,
        style: $styles.displaySmall.copyWith(color: AppColors.white),
      ),
    );
  }
}
