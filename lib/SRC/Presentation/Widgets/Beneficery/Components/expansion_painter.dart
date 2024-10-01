import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class ExpandedCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8051168, size.height * 0.03250300);
    path_0.lineTo(size.width * 0.7560370, size.height * 0.1970008);
    path_0.cubicTo(
        size.width * 0.7501966,
        size.height * 0.2165704,
        size.width * 0.7370427,
        size.height * 0.2292979,
        size.width * 0.7224444,
        size.height * 0.2295017);
    path_0.lineTo(size.width * 0.07901083, size.height * 0.2384808);
    path_0.cubicTo(size.width * 0.03525299, size.height * 0.2390913, 0,
        size.height * 0.2911433, 0, size.height * 0.3551421);
    path_0.lineTo(0, size.height * 0.8812500);
    path_0.cubicTo(
        0,
        size.height * 0.9456833,
        size.width * 0.03571510,
        size.height * 0.9979167,
        size.width * 0.07977208,
        size.height * 0.9979167);
    path_0.lineTo(size.width * 0.4992877, size.height * 0.9979167);
    path_0.lineTo(size.width * 0.9188034, size.height * 0.9979167);
    path_0.cubicTo(
        size.width * 0.9628604,
        size.height * 0.9979167,
        size.width * 0.9985755,
        size.height * 0.9456833,
        size.width * 0.9985755,
        size.height * 0.8812500);
    path_0.lineTo(size.width * 0.9985755, size.height * 0.05416667);
    path_0.cubicTo(size.width * 0.9985755, size.height * 0.02425125,
        size.width * 0.9819943, 0, size.width * 0.9615385, 0);
    path_0.lineTo(size.width * 0.8390627, 0);
    path_0.cubicTo(
        size.width * 0.8243362,
        0,
        size.width * 0.8110085,
        size.height * 0.01276163,
        size.width * 0.8051168,
        size.height * 0.03250300);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xffF4F4F4).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

