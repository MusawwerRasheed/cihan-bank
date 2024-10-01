import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class ListViewItem extends StatelessWidget {
  final String text;
  final String icon;
  final bool? isSelected;
  final VoidCallback onTap;
  final EdgeInsets? pad;

  const ListViewItem({
    this.pad,
    super.key,
    required this.text,
    required this.icon,
    this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    mediaQueryData = MediaQuery.of(context);
    bool selected = isSelected ?? false;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: pad ?? EdgeInsets.symmetric(vertical: 14, horizontal: 9),
        decoration: BoxDecoration(
          color: selected
              ? themeData.colorScheme.onPrimaryContainer.withOpacity(0.1)
              : themeData.colorScheme.onTertiaryContainer,
          borderRadius: BorderRadius.circular(27),
          border: selected
              ? Border.all(
                  width: 2,
                  color: themeData.colorScheme.onPrimaryContainer,
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AssetImageWidget(
                url: icon,
                height: 0.04.sh,
                width: 0.04.sw,
                color: selected
                    ? themeData.colorScheme.onPrimaryContainer
                    : themeData.colorScheme.background,
                fit: BoxFit.scaleDown),
            4.y,
            Expanded(
              child: AppText(
                text,
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: selected
                      ? themeData.colorScheme.onPrimaryContainer
                      : themeData.colorScheme.background,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
