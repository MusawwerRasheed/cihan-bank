import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class CustomCard extends StatefulWidget {
  final String icon;
  final Color iconBackgroundColor;
  final String title;
  final String description;
  final VoidCallback onTap;

  const CustomCard({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11.rSA, horizontal: 15.rSA),
        decoration: BoxDecoration(
          color: LightColorsPalate.unselectContainerColor,
          borderRadius: BorderRadius.circular(19.rSA),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.all(8.rSA),
                  decoration: BoxDecoration(
                    color: widget.iconBackgroundColor,
                    borderRadius: BorderRadius.circular(2.01.rSA),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x40000000),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: AssetImageWidget(
                    url: widget.icon,
                    fit: BoxFit.fitHeight,
                  )),
              const Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
          7.y,
          AppText(
            widget.title,
            style: themeData.textTheme.titleLarge!.copyWith(
                fontSize: 19.fS, color: LightColorsPalate.backgroundColor),
          ),
          AppText(
            maxLine: 4,
            widget.description,
            style: themeData.textTheme.displaySmall!.copyWith(
                fontSize: 11.fS, color: LightColorsPalate.backgroundColor),
          ),
        ]),
      ),
    );
  }
}
