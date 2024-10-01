import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class CommonDialogs {
  static showCommonDialogue({
    required BuildContext context,
    IconData? icon,
    String? svgPath,
    double iconHeight = 96,
    double? iconWidth,
    EdgeInsetsGeometry iconMargins = EdgeInsets.zero,
    Color? iconColor,
    String? title,
    Color? titleTextColor,
    double? titleTextSize,
    FontWeight? titleFontWeight,
    String? description,
    Color? descriptionTextColor,
    double? descriptionTextSize,
    FontWeight? descriptionFontWeight,
    List<Widget>? actions,
    bool? barrierDismissible,
    double radius = 20,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    EdgeInsetsGeometry? titlePadding,
    EdgeInsetsGeometry? descriptionPadding,
    bool showCloseIcon = false,
    Color? closeIconColor,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (ctx) {
        return Dialog(
          insetPadding: const EdgeInsets.all(34),
          elevation: 20,
          shadowColor: Theme.of(context).colorScheme.tertiary,
          clipBehavior: Clip.hardEdge,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: padding ?? const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color:
                  backgroundColor ?? Theme.of(context).colorScheme.background,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: crossAxisAlignment,
              mainAxisAlignment: mainAxisAlignment,
              children: [
                if (showCloseIcon)
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.close,
                        color: closeIconColor ??
                            LightColorsPalate.backgroundColor),
                  ).onTapped(onTap: () {
                    AppContext.navigatorKey.currentContext!.back();
                  }),
                DynamicAppIconHandler.buildIcon(
                  context: context,
                  icon: icon,
                  svg: svgPath,
                  iconHeight: iconHeight,
                  iconWidth: iconWidth,
                  margins: iconMargins,
                  iconColor: iconColor,
                ),
                if (title != null)
                  Padding(
                    padding: titlePadding ??
                        const EdgeInsets.only(top: 4, bottom: 4),
                    child: AppText(
                      title,
                      maxLine: 3,
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: titleTextColor ??
                                    Theme.of(context).colorScheme.onBackground,
                                fontWeight: titleFontWeight,
                                fontSize: titleTextSize,
                              ),
                    ),
                  ),
                if (description != null)
                  Padding(
                    padding: descriptionPadding ??
                        EdgeInsets.only(
                            bottom: (actions != null && actions.isNotEmpty)
                                ? 26
                                : 0),
                    child: AppText(
                      description,
                      maxLine: 10,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: descriptionTextColor ??
                                Theme.of(context).colorScheme.onBackground,
                            fontWeight: descriptionFontWeight,
                            fontSize: descriptionTextSize,
                          ),
                    ),
                  ),
                if (actions != null && actions.isNotEmpty) ...actions
              ],
            ),
          ),
        );
      },
    );
  }

  static showCustomDialogue({
    required BuildContext context,
    double radius = 20,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    required Widget child,
    double elevation = 20,
    EdgeInsets? insetPadding,
  }) {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          insetPadding: insetPadding ?? const EdgeInsets.all(24),
          elevation: elevation,
          shadowColor: Theme.of(context).colorScheme.tertiary,
          clipBehavior: Clip.hardEdge,
          backgroundColor: Colors.transparent,
          child: Container(
              padding: padding ?? const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color:
                    backgroundColor ?? Theme.of(context).colorScheme.background,
              ),
              child: child),
        );
      },
    );
  }

  static showLoadingDialogue({required BuildContext context}) {
    return showCustomDialogue(
      backgroundColor: Colors.transparent,
      elevation: 0,
      padding: EdgeInsets.zero,
      context: context,
      child:
          //Note: This Icon will be replace with the actual Loading Asset provided by the Designer team, which we haven't got yet!
          const Icon(
        size: 50,
        Icons.downloading_outlined,
      ),
    );
  }

  static showSuccessDialogue({
    required BuildContext context,
    required String title,
    bool? barrierDismissible,
    List<Widget>? actions,
  }) {
    return showCommonDialogue(
      showCloseIcon: true,
      context: context,
      barrierDismissible: barrierDismissible,
      titleTextColor: LightColorsPalate.backgroundColor,
      titleFontWeight: FontWeight.w400,
      iconHeight: 240,
      backgroundColor: LightColorsPalate.successColor,
      svgPath: Assets.icons.checkIconIllustrations,
      title: title,
      titleTextSize: 17,
      actions: actions,
    );
  }

  static showFailureDialogue({
    required BuildContext context,
    required String title,
    //int? numberOflogin,
    bool? barrierDismissible,
    List<Widget>? actions,
  }) {
    return showCommonDialogue(
      showCloseIcon: true,
      context: context,
      barrierDismissible: barrierDismissible,
      titleTextColor: LightColorsPalate.backgroundColor,
      titleFontWeight: FontWeight.w400,
      iconHeight: 240,
      backgroundColor: LightColorsPalate.errorColor,
      svgPath: Assets.icons.checkFailure,
      title: title,
      titleTextSize: 14,
      actions: actions,
    );
  }

  static showErrorDialogue({
    required BuildContext context,
    required String title,
    List<Widget>? actions,
  }) {
    return showCommonDialogue(
      showCloseIcon: true,
      closeIconColor: LightColorsPalate.blackColor,
      context: context,
      titleTextColor: LightColorsPalate.blackColor,
      titleFontWeight: FontWeight.w400,
      iconHeight: 240,
      backgroundColor: LightColorsPalate.backgroundColor,
      svgPath: Assets.icons.warning,
      title: title,
      titleTextSize: 17,
      actions: actions,
    );
  }
}
