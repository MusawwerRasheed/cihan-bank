import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class AppTheme with customLightTheme, customDarkTheme {
  AppTheme._();

  static AppTheme instance = AppTheme._();

  factory AppTheme() => instance;
  ValueNotifier<ThemeMode> currentTheme = ValueNotifier(ThemeMode.light);

  toggleTheme() {
    currentTheme.value = currentTheme.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    currentTheme.notifyListeners();
    SharedPrefs.setThemePrefs();
  }

  setTheme(ThemeMode themeMode) {
    currentTheme.value = themeMode;
    currentTheme.notifyListeners();
  }
}
