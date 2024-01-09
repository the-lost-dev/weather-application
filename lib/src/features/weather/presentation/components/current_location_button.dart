import 'package:weather_app/exports.dart';

import 'custom_button.dart';

class CurrentLocationButton extends ConsumerWidget {
  const CurrentLocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(currentLocationFutureProvider);
    return PrimaryButton(
      isLoading: state.isLoading,
      onPressed: () {
        ref.invalidate(cityProvider);
        ref.invalidate(currentLocationFutureProvider);
      },
    );
  }
}
