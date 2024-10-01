import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:flutter/material.dart';

class BankingTodayTile extends StatelessWidget {
  const BankingTodayTile({
    super.key,
    required this.leadingText,
    required this.title,
    required this.subtitle,
    this.width,
    this.endTitle,
    this.endSubtitle,
    this.showIcon = false,
    this.showEnd = false,
    this.color,
  });

  final String leadingText;
  final String title;
  final String subtitle;
  final String? endTitle;
  final String? endSubtitle;
  final double? width;
  final bool showIcon;
  final bool showEnd;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 76.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            color: theme.colorScheme.tertiary.withOpacity(0.4),
          ),
        ],
      ),
      padding: EdgeInsets.all(6.fS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width ?? 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: color ?? theme.colorScheme.error,
            ),
            child: Center(
              child: showIcon
                  ? AssetImageWidget(
                      url: color == LightColorsPalate.successColor
                          ? Assets.icons.backDegreeArrow
                          : Assets.icons.frontDegreeArrow,
                      height: 13.h,
                      fit: BoxFit.contain,
                    )
                  : AppText(
                      leadingText,
                      style: theme.textTheme.bodySmall!.copyWith(
                        fontSize: 10.fS,
                        color: theme.colorScheme.error,
                      ),
                    ),
            ),
          ),
          10.x,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showEnd ? 10.y : 0.y,
                Expanded(
                  child: AppText(
                    title,
                    maxLine: 3,
                    style: theme.textTheme.displaySmall!
                        .copyWith(color: LightColorsPalate.secondaryColor),
                  ),
                ),
                showEnd
                    ? SizedBox()
                    : AppText(
                        subtitle,
                        style: theme.textTheme.displaySmall!
                            .copyWith(color: LightColorsPalate.secondaryColor),
                      ),
              ],
            ),
          ),
          showEnd
              ? Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        endTitle!,
                        maxLine: 2,
                        style: theme.textTheme.bodyMedium!.copyWith(),
                      ),
                      AppText(
                        endSubtitle!,
                        style: theme.textTheme.displaySmall!.copyWith(
                            fontSize: 9.fS,
                            color: LightColorsPalate.tertiaryColor),
                      ),
                    ],
                  ).pad(EdgeInsets.only(right: 25.fS)),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
