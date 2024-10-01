import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class ExpansionArrow extends StatelessWidget {
  final String url;
  final Color? color;
  const ExpansionArrow({
    super.key,
    required this.url,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color ?? LightColorsPalate.lightGreyColor,
          shape: BoxShape.circle),
      padding: EdgeInsets.all(11.rSA),
      child: AssetImageWidget(
        url: url,
        fit: BoxFit.fitHeight,
        height: 9.h,
        width: 9.w,
        color: LightColorsPalate.arrowGreyColor,
      ),
    );
  }
}
