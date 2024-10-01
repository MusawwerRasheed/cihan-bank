import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class CardItem {
  final String icon;
  final Color iconBackgroundColor;
  final String title;
  final String description;
  final VoidCallback onTap;

  CardItem({
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.description,
    required this.onTap,
  });
}
