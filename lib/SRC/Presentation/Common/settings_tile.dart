import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class SettingTile extends StatelessWidget {
  SettingTile({
    super.key,
    required this.leadingIconPath,
    required this.title,
    this.color,
    this.titleColor,
    required this.onTap,
  });
  final String leadingIconPath;
  final String title;
  final VoidCallback onTap;
  Color? color;
  Color? titleColor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: theme.colorScheme.outline,
        ),
      ),
      child: MaterialButton(
        onPressed: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            DynamicAppIconHandler.buildIcon(
              context: context,
              svg: leadingIconPath,
              iconColor: color ?? theme.colorScheme.onBackground,
            ),
            10.x,
            AppText(
              title,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: titleColor ?? theme.colorScheme.onBackground,
                fontSize: 13,
              ),
            ),
            const Spacer(),
            DynamicAppIconHandler.buildIcon(
              context: context,
              svg: Assets.icons.arrowIosIcon,
              iconColor: theme.colorScheme.onBackground,
            ),
            10.x,
          ],
        ),
      ),
    );
  }
}
