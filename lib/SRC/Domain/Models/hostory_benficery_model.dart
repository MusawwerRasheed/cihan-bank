import 'dart:ui';

class HistoryBenModel {
  final String description;
  final String? iconPath;
  final Color? backGroundColor;
  final int? quantity;
  final String?  time;


//  final DateTime date;

  HistoryBenModel(  {
    required this.description,
    this.iconPath,
    this.quantity, this.time,
    this.backGroundColor,

  });
}
