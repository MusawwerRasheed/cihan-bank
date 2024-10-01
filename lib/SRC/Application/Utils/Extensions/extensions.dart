import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';

extension CustomSizedBoxExt on num {
  SizedBox get x => SizedBox(width: toDouble());

  SizedBox get y => SizedBox(height: toDouble());
}

extension StackExtension on Widget {
  //l(double value) => withMargin(EdgeInsets.symmetric(vertical: value));
  Stack stackIt(List<Widget> items,
      {AlignmentGeometry? alignment,
      TextDirection? textDirection,
      int reorder = 0,
      StackFit? fit,
      Clip? clipBehavior}) {
    List<Widget> reOrderList = [];

    reOrderList = _reorderList(items, reorder, this);

    return Stack(
      alignment: alignment ?? AlignmentDirectional.center,
      fit: fit ?? StackFit.loose,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      children: reOrderList,
    );
  }

  List<Widget> _reorderList(List<Widget> items, int order, Widget parent) {
    List<Widget> fullItems = [parent, ...items];
    List<Widget> firstHalf = [];
    List<Widget> secondHalf = [];

    if (order == 0 || order > fullItems.length - 1) {
      print("in condition");

      return fullItems;
    }

    firstHalf = items.sublist(0, order);
    firstHalf.add(parent);

    secondHalf = items.sublist(order, items.length);

    return [...firstHalf, ...secondHalf];
  }
}

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (startsWith('http') || startsWith('https')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

enum ImageType { svg, png, network, file, unknown }

extension OfficeTimingsExtension on String {
  List<String> getOfficeTimings(String season) {
    // "Office Timing: Summer  (10:00am  08:00pm), Winter  (10:00am  07:00pm)"
    final seasonSplit = season.split("Office Timing:");

    final seasonSplit2 = seasonSplit[1].split(",");

    final summer = seasonSplit2[0].split("Summer")[1];

    final winter = seasonSplit2[1].split("Winter")[1];

    return [summer, winter];
  }
}

extension date on DateTime {
  ///Example:
  ///Convert 2023-5-9 21:12:23:000Z to 9,May 2023

  String get toPkDate {
    int day = this.day;
    var monthNames = [
      " ",
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return "$day ${monthNames[month]}, $year";
  }

  ///Example:
  ///Convert 2023-5-9 21:12:23:000Z to 9:12:23 PM
  String get toPkTime {
    // int hour = this.hour;
    // int minute = this.minute;
    // int sec = second;

    String formattedTime = DateFormat('h:mm a').format(this);

    return formattedTime;
  }

  ///Example:
  ///Convert 2023-5-9 21:12:23:000Z to 9:12 PM
  String get toHourAndMinutes {
    int hour = this.hour;
    int minute = this.minute;

    String formattedTime =
        DateFormat('h:mm a').format(DateTime(2022, 1, 1, hour, minute));

    List<String> parts = formattedTime.split(' ');
    String timePart = parts[0]; // Contains the time part (hour:minute)
    String ampmPart = parts[1]; // Contains the AM/PM part

    // Split the time part into hour and minute
    List<String> timeParts = timePart.split(':');
    int formattedHour = int.parse(timeParts[0]);
    int formattedMinute = int.parse(timeParts[1]);

    // Apply formatting logic
    String finalHour =
        formattedHour < 10 ? '0$formattedHour' : '$formattedHour';
    String finalMinute =
        formattedMinute < 10 ? '0$formattedMinute' : '$formattedMinute';

    return "$finalHour:$finalMinute $ampmPart";
  }

  String timeAgo({bool numericDates = true}) {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays >= 365) {
      final years = (difference.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''} ago';
    } else if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  String get humanReadableDate {
    //print("object");
    return intl.DateFormat('yyyy-MM-dd').format(this);
  }

  String get weekName {
    return DateFormat('EEEE').format(this);
  }

  DateTime get nowTypeFormatData {
    DateFormat outputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

    String formattedDate = outputFormat.format(this);

    return DateTime.parse(formattedDate);
  }
}

extension str on String {
  String get readableTime {
    DateTime dateTime = DateTime.parse(this);
    String timeString = DateFormat.Hm().format(dateTime);
    return timeString;
  }
}

extension StringExt2 on int {
  // String getMonthName(bool isJalali){
  //   if(isJalali)
  //     return this.jalaliMonthName;
  //   else
  //     return this.gregorianMonthName;
  // }

  String get jalaliMonthName {
    switch (this) {
      case 1:
        return "فروردین";

      case 2:
        return "اردیبهشت";
      case 3:
        return "خرداد";
      case 4:
        return "تیر";
      case 5:
        return "مرداد";
      case 6:
        return "شهریور";
      case 7:
        return "مهر";
      case 8:
        return "آبان";
      case 9:
        return "آذر";
      case 10:
        return "دی";
      case 11:
        return "بهمن";
      case 12:
        return "اسفند";
      default:
        return '$this';
    }
  }

  String get englishName {
    switch (this) {
      case 1:
        return "Jan";

      case 2:
        return "Feb";

      case 3:
        return "March";

      case 4:
        return "April";

      case 5:
        return "May";

      case 6:
        return "June";

      case 7:
        return "July";

      case 8:
        return "Aug";

      case 9:
        return "Sep";

      case 10:
        return "Oct";

      case 11:
        return "Nov";

      case 12:
        return "Dec";

      default:
        return '$this';
    }
  }
}

extension PaddingExtension on Widget {
  Widget pad(EdgeInsets padding) => Padding(padding: padding, child: this);

  Widget padAll(double value) => pad(EdgeInsets.all(value));

  Widget padHorizontal(double value) =>
      pad(EdgeInsets.symmetric(horizontal: value));

  Widget padsymatric(double value, double anothervalue) =>
      pad(EdgeInsets.symmetric(horizontal: value, vertical: anothervalue));

  Widget padVertical(double value) =>
      pad(EdgeInsets.symmetric(vertical: value));
}

extension GestureExtension on Widget {
  Widget onTapped({required void Function() onTap}) => GestureDetector(
        onTap: onTap,
        child: this,
      );

  // Double tap gesture
  Widget onDoubleTapped({required void Function() onDoubleTap}) =>
      GestureDetector(
        onDoubleTap: onDoubleTap,
        child: this,
      );

  // Long press gesture
  Widget onLongPress({required void Function() onLongPress}) => GestureDetector(
        onLongPress: onLongPress,
        child: this,
      );

  // Drag gesture
  Widget onDrag({required void Function(DragStartDetails details) onDrag}) =>
      GestureDetector(
        onPanStart: onDrag,
        child: this,
      );

  // Drag update gesture (for tracking drag movement)
  Widget onDragUpdate(
          {required void Function(DragUpdateDetails details) onDragUpdate}) =>
      GestureDetector(
        onPanUpdate: onDragUpdate,
        child: this,
      );

  // Drag end gesture
  Widget onDragEnd(
          {required void Function(DragEndDetails details) onDragEnd}) =>
      GestureDetector(
        onPanEnd: onDragEnd,
        child: this,
      );
}

extension MarginExtension on Widget {
  Widget withMargin(EdgeInsets margin) => Container(
        margin: margin,
        child: this,
      );

  Widget marginAll(double value) => withMargin(EdgeInsets.all(value));

  Widget marginHorizontal(double value) =>
      withMargin(EdgeInsets.symmetric(horizontal: value));

  Widget marginVertical(double value) =>
      withMargin(EdgeInsets.symmetric(vertical: value));
}

///textExtension
// extension TextExtension on String {
//   AppText toText({TextStyle? style,BuildContext? context}) => AppText(this, style: style??Styles.circularStdRegular(context!));
// }
extension ContainerSizeExtension on num {
  // Container get cH => sized(height: toDouble());
  //Container get cW => sized(width: toDouble());

  Container cH({
    double? width,
    double? height,
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Border? border,
    Decoration? decoration,
    Widget? child,
  }) {
    return Container(
      width: width ?? toDouble(),
      height: height ?? toDouble(),
      color: color,
      margin: margin,
      padding: padding,
      decoration: decoration,
      child: child,
    );
  }
}
