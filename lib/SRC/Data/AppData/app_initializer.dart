import 'package:cihan_bank_mobile_banking/SRC/Application/Services/Notification/notification_services.dart';

import '../../Application/Services/SharedPreferences/app_preferences.dart';

mixin AppInitializer {
  Future init() async {
    await NotificationServices().initNotification();
    _user();

    // Data().registerServices();
  }

  static Future _user() async {
    await SharedPrefs.init().whenComplete(() async {
      // await SharedPrefs.getUserLoginData();

      SharedPrefs.setGetTheme();
      SharedPrefs.setGetLocale();

      // SharedPrefs.getUserToken();
    });
  }
}
