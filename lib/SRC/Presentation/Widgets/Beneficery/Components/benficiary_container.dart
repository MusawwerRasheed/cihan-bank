import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class BenficiaryContainer extends StatelessWidget {
  const BenficiaryContainer(
      {super.key, this.isSelected, this.title, this.svgPath});
  final bool? isSelected;
  final String? title;
  final String? svgPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: isSelected == true
            ? LightColorsPalate.benificiaryBlueSelectedColor
            : LightColorsPalate.benficiaryDarkColor,
        shape: RoundedRectangleBorder(
          side: isSelected == true
              ? const BorderSide(width: 1, color: Color(0xFF1151B1))
              : BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F70727D),
            blurRadius: 6.10,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      width: 80.w,
      height: 77.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DynamicAppIconHandler.buildIcon(
              context: context, svg: svgPath, iconHeight: 25, iconWidth: 25),
          AppText(
            title ?? "",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: isSelected == true
                    ? LightColorsPalate.benificiaryBlueSelectedColor
                    : null),
            maxLine: 2,
          ).withMargin(const EdgeInsets.only(left: 10))
        ],
      ),
    );
  }
}