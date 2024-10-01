import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class CurrencyItemWidget extends StatelessWidget {
  const CurrencyItemWidget({
    super.key,
    required this.isSelected,
    required this.e,
  });

  final bool isSelected;
  final Map<String, dynamic> e;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 114,
      decoration: BoxDecoration(
          color: isSelected
              ? LightColorsPalate.blueBorderColor.withOpacity(0.2)
              : theme.colorScheme.onTertiaryContainer,
          borderRadius: BorderRadius.circular(27),
          border: isSelected
              ? Border.all(
                  width: 2,
                  color: theme.colorScheme.onPrimaryContainer,
                )
              : null),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            e.keys.first,
            style: theme.textTheme.titleLarge!.copyWith(
                color: isSelected
                    ? LightColorsPalate.blueBorderColor
                    : theme.colorScheme.background,
                fontSize: 22),
          ),
          4.y,
          AppText(
            e.values.first,
            style: theme.textTheme.bodySmall!.copyWith(
              color: isSelected
                  ? LightColorsPalate.blueBorderColor
                  : theme.colorScheme.background,
            ),
          ),
        ],
      ),
    );
  }
}
