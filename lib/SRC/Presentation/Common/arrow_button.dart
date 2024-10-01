import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton(
      {super.key,
      required this.iconPath,
      required this.title,
      this.subTitle,
      this.fromTransfer,
      this.leadingColor,
      this.iconColor});

  final String iconPath;
  final String title;
  final Color? iconColor;
  final bool? fromTransfer;
  final Color? leadingColor;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: themeData.colorScheme.surfaceVariant),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              4,
              (index) => DynamicAppIconHandler.buildIcon(
                context: context,
                // margins: EdgeInsets.only(left: 2.rSA),
                //iconWidth: 70.w,
                svg: Assets.icons.arrowForwardIterated,
                iconColor: themeData.colorScheme.tertiary
                    .withOpacity((index + 1) * 0.2),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                18.x,
                Container(
                  decoration: fromTransfer != null
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          color: leadingColor ?? themeData.colorScheme.primary)
                      : null,
                  child: AssetImageWidget(
                    url: iconPath,
                    fit: BoxFit.scaleDown,
                    height: 52,
                    color: iconColor,
                    width: 52,
                  ),
                ),
                10.x,
                Column(
                  mainAxisAlignment: fromTransfer == null && subTitle != null
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title,
                      style: themeData.textTheme.bodyLarge!.copyWith(
                          color: themeData.colorScheme.onSecondaryContainer,
                          fontSize: 20.fS),
                    ),
                    if (subTitle != null)
                      AppText(
                        subTitle!,
                        style: themeData.textTheme.bodyLarge!.copyWith(
                            color: const Color(0xff9A9A9A), fontSize: 14.fS),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
