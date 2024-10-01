import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class HomeCards extends StatelessWidget {
  const HomeCards({
    super.key,
    required this.icons,
    required this.index,
    required this.color,
    required this.text,
  });

  final List<String> icons;
  final Color color;
  final List<String> text;
  final int index;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 69, maxHeight: 99),
      child: Card(
        elevation: 1,
        child: Container(
          decoration: BoxDecoration(
              color: LightColorsPalate.backgroundColor,
              borderRadius: BorderRadius.circular(6.rSA)),
          padding: EdgeInsets.symmetric(horizontal: 8.fS, vertical: 7.fS),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(6.rSA)),
                  padding: EdgeInsets.all(11.fS),
                  child: AssetImageWidget(
                    url: icons[index],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              6.y,
              Expanded(
                child: AppText(
                  maxLine: 3,
                  textAlign: TextAlign.center,
                  text[index],
                  style: themeData.textTheme.displaySmall!.copyWith(
                      fontSize: 9.fS, color: LightColorsPalate.greyLightColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
