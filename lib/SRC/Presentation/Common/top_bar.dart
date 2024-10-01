import 'package:flutter/material.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    this.horizontalPad,
    this.actionIcon,
    this.scaffoldKey,
  });

  final double? horizontalPad;
  final String? actionIcon;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DynamicAppIconHandler.buildIcon(
          context: context,
          svg: Assets.icons.backArrowIcon,
        ).onTapped(onTap: () {
          Navigator.of(context).pop();
        }),
        if (actionIcon != null)
          DynamicAppIconHandler.buildIcon(
            context: context,
            fit: BoxFit.scaleDown,
            svg: actionIcon!,
          ).onTapped(onTap: () {
            print("${scaffoldKey?.currentState}");
            scaffoldKey?.currentState?.openDrawer();
            print("scaffoldKey$scaffoldKey");
          })
        else
          DynamicAppIconHandler.buildIcon(
            context: context,
            fit: BoxFit.scaleDown,
            svg: Assets.icons.globe,
          ),
      ],
    ).padHorizontal(horizontalPad ?? 0);
  }
}
