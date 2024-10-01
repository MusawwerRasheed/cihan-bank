import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class SubExpansionTile extends StatelessWidget {
  const SubExpansionTile({
    super.key,
    required this.ifExpanded,
    required this.title,
  });

  final bool ifExpanded;
  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title,
          style: themeData.textTheme.bodyMedium!.copyWith(
              fontSize: 19.fS, color: LightColorsPalate.dialogTextColor),
        ),
        ExpansionArrow(
          color: Colors.transparent,
          url: ifExpanded ? Assets.icons.arrowup : Assets.icons.arrowDown,
        )
      ],
    );
  }
}
