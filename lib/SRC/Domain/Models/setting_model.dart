import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class SettingModel {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  SettingModel({
    required this.title,
    required this.iconPath,
    required this.onTap,
  });
}
