import 'package:weather_app/exports.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({super.key, required this.value, required this.data});
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
        data: data,
        error: (e, st) {
          final error = e as AppException;
          return ErrorMessageWidget(errorMsg: error.message);
        },
        loading: () => const LoadingIndicator());
  }
}
