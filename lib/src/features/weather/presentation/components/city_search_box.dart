import 'package:weather_app/exports.dart';

class CitySearchBox extends ConsumerStatefulWidget {
  const CitySearchBox({super.key});
  @override
  ConsumerState<CitySearchBox> createState() => _CitySearchRowState();
}

class _CitySearchRowState extends ConsumerState<CitySearchBox> {
  late final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(cityProvider);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.p60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              style: $styles.bodyMedium.copyWith(color: AppColors.black),
              decoration: const InputDecoration(
                fillColor: AppColors.white,
                filled: true,
                contentPadding: EdgeInsets.all(AppSizes.p20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.p30),
                    bottomLeft: Radius.circular(AppSizes.p30),
                  ),
                ),
              ),
              onSubmitted: (value) =>
                  ref.read(cityProvider.notifier).state = value,
            ),
          ),
          InkWell(
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppSizes.p30),
                  bottomRight: Radius.circular(AppSizes.p30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.p16),
                child: Text(AppStrings.search, style: $styles.bodyLarge),
              ),
            ),
            onTap: () {
              FocusScope.of(context).unfocus();
              ref.read(cityProvider.notifier).state = _searchController.text;
            },
          )
        ],
      ),
    );
  }
}
