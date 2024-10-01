import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/Resources/Styles/app_textstyles.dart';
import 'package:flutter/material.dart';

import '../Colors/lightcolorpallete.dart';

mixin customLightTheme {
  ThemeData lightTheme = ThemeData(
    colorScheme: colorAppScheme,
    buttonTheme: buttonThemeData,
    textTheme: textTheme,
    iconTheme: iconThemeData,
    inputDecorationTheme: inputDecorationTheme,
    appBarTheme: appBarTheme,
    chipTheme: chipThemeData,
    bottomNavigationBarTheme: bottomNavigationBarThemeData,
    dialogTheme: dialogTheme,
    snackBarTheme: snackBarTheme,
    dividerTheme: dividerThemeData,
  );
  static ButtonThemeData buttonThemeData = const ButtonThemeData(
    buttonColor: LightColorsPalate.primaryColor,
    disabledColor: LightColorsPalate.primaryDisableColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
  );
  static ColorScheme colorAppScheme = ColorScheme(
      brightness: Brightness.light,
      primary: LightColorsPalate.primaryColor,
      outlineVariant: const Color.fromRGBO(177, 24, 17, 1),
      onPrimary: LightColorsPalate.backgroundColor,
      onErrorContainer: LightColorsPalate.gred3Color,
      secondary: LightColorsPalate.secondaryColor,
      onSecondary: LightColorsPalate.backgroundColor,
      error: LightColorsPalate.errorColor,
      secondaryContainer: LightColorsPalate.dropDownFillOutlineColor,
      primaryContainer: LightColorsPalate.primaryDisableColor,
      onError: LightColorsPalate.backgroundColor,
      background: LightColorsPalate.backgroundColor,
      onPrimaryFixed: LightColorsPalate.blackColor,
      onSecondaryContainer: LightColorsPalate.homeGreyColor,
      tertiaryContainer: LightColorsPalate.greyColor,
      surface: LightColorsPalate.surfaceColor,
      onSurface: LightColorsPalate.onSurfaceColor,
      onInverseSurface: LightColorsPalate.arrowGreyColor,
      onSurfaceVariant: LightColorsPalate.arrowBackColor,
      onPrimaryContainer: LightColorsPalate.blueBorderColor,
      outline: LightColorsPalate.dropDownFillOutlineColor,
      inversePrimary: LightColorsPalate.backgroundColor,
      tertiary: LightColorsPalate.tertiaryColor,
      onTertiary: LightColorsPalate.successColor,
      inverseSurface: LightColorsPalate.blackHomeCircleColor,
      surfaceTint: LightColorsPalate.bottomSheetBackColor,
      onTertiaryContainer: LightColorsPalate.unselectContainerColor);

  static IconThemeData iconThemeData = const IconThemeData(
    color: LightColorsPalate.blackColor,
  );
  static AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: LightColorsPalate.backgroundColor,
    surfaceTintColor: LightColorsPalate.backgroundColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: AppTextStyles.poppinsBold(
      color: LightColorsPalate.blackColor,
      fontSize: 21,
    ),
  );
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    hintStyle: AppTextStyles.poppinsMedium(
      color: LightColorsPalate.hintTextColor,
      fontSize: 13,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    fillColor: LightColorsPalate.textFiledFillColor,
    filled: true,
    suffixIconColor: LightColorsPalate.suffixIconColor,
    prefixIconColor: LightColorsPalate.suffixIconColor,
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: LightColorsPalate.border),
      borderRadius: BorderRadius.circular(52),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: LightColorsPalate.border),
      borderRadius: BorderRadius.circular(52),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: LightColorsPalate.border),
      borderRadius: BorderRadius.circular(52),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: LightColorsPalate.border),
      borderRadius: BorderRadius.circular(52),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: LightColorsPalate.errorColor,
      ),
      borderRadius: BorderRadius.circular(52),
    ),
  );
  static ChipThemeData chipThemeData = ChipThemeData(
    backgroundColor: LightColorsPalate.surfaceColor,
    disabledColor: LightColorsPalate.surfaceColor,
    selectedColor: LightColorsPalate.primaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(
          width: 1, color: LightColorsPalate.dropDownFillOutlineColor),
    ),
    showCheckmark: false,
    brightness: Brightness.light,
    labelStyle: AppTextStyles.poppinsRegular(
      fontSize: 13,
      color: LightColorsPalate.blackColor,
    ),
  );
  static BottomNavigationBarThemeData bottomNavigationBarThemeData =
      const BottomNavigationBarThemeData(
    unselectedItemColor: LightColorsPalate.tertiaryColor,
    selectedItemColor: LightColorsPalate.primaryColor,
  );
  static DialogTheme dialogTheme = DialogTheme(
    iconColor: LightColorsPalate.warningTextColor,
    backgroundColor: LightColorsPalate.dialogBackColor,
    alignment: Alignment.center,
    titleTextStyle: AppTextStyles.poppinsSemiBold20(
      color: LightColorsPalate.dialogTextColor,
    ),
    contentTextStyle: AppTextStyles.poppinsSemiBold20(
      color: LightColorsPalate.dialogTextColor,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
  static SnackBarThemeData snackBarTheme = SnackBarThemeData(
    backgroundColor: LightColorsPalate.blackColor,
    actionTextColor: LightColorsPalate.backgroundColor,
    actionBackgroundColor: LightColorsPalate.primaryColor,
    contentTextStyle: AppTextStyles.poppinsRegular(
      color: LightColorsPalate.backgroundColor,
      fontSize: 15,
    ),
  );

  static DividerThemeData dividerThemeData = const DividerThemeData(
      color: LightColorsPalate.dropDownFillOutlineColor,
      thickness: 1,
      space: 1);

  static TextTheme textTheme = TextTheme(
    headlineLarge: AppTextStyles.poppinsSemiBold20(
      fontSize: 37,
      color: LightColorsPalate.backgroundColor,
    ),
    headlineMedium: AppTextStyles.poppinsBold(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: LightColorsPalate.blackColor,
    ),
    headlineSmall: AppTextStyles.poppinsMedium(
      fontSize: 21,
      fontWeight: FontWeight.w500,
      color: LightColorsPalate.secondaryColor,
    ),
    titleLarge: AppTextStyles.poppinsBold(
      fontSize: 19,
      fontWeight: FontWeight.w600,
      color: LightColorsPalate.blackColor,
    ),
    titleMedium: AppTextStyles.poppinsBold(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: LightColorsPalate.primaryColor,
    ),
    titleSmall: AppTextStyles.poppinsMedium(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: LightColorsPalate.blackColor,
    ),
    bodyLarge: AppTextStyles.poppinsRegular(
      fontSize: 26,
      fontWeight: FontWeight.w400,
      color: LightColorsPalate.secondaryColor,
    ),
    bodyMedium: AppTextStyles.poppinsRegular(
      fontSize: 19,
      fontWeight: FontWeight.w400,
      color: LightColorsPalate.secondaryColor,
    ),
    bodySmall: AppTextStyles.poppinsRegular(
      fontWeight: FontWeight.w400,
      color: LightColorsPalate.secondaryColor,
    ),
    displaySmall: AppTextStyles.poppinsLight(
      color: LightColorsPalate.backgroundColor,
    ),
  );
}
