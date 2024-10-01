import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class IDsPickerTile extends StatelessWidget {
  const IDsPickerTile({
    super.key,
    required this.title,
    required this.isPending,
  });

  final String title;
  final bool isPending;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      title: AppText(
        title,
        style: theme.textTheme.titleMedium!
            .copyWith(color: theme.colorScheme.onBackground, fontSize: 16),
      ),
      trailing: Container(
        height: 34,
        width: 80,
        decoration: BoxDecoration(
          color: isPending
              ? LightColorsPalate.tertiaryColor.withOpacity(0.2)
              : LightColorsPalate.lightGreenColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: DynamicAppIconHandler.buildIcon(
              context: context,
              svg: isPending
                  ? Assets.icons.cameraIcon
                  : Assets.icons.checkRingIcon),
        ),
      ),
    );
  }
}
