import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/Commons/explore_chips.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/Commons/subexpansion_tile.dart';

class CustomChip extends StatefulWidget {
  const CustomChip({
    super.key,
    required this.title,
    required this.subTitle,
    required this.bottomOntap,
    required this.ifExpanded,
    required this.expandOntap,
    required this.child,
    this.height,
    this.maxHeight,
  });

  final String title;
  final String subTitle;
  final Widget child;
  final double? maxHeight;
  final double? height;
  final VoidCallback expandOntap;
  final bool ifExpanded;
  final VoidCallback bottomOntap;

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.fS),
      decoration: BoxDecoration(
          color: LightColorsPalate.chipBackColor,
          border: Border.all(color: LightColorsPalate.chipborderColor),
          borderRadius: BorderRadius.circular(11.rSA)),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubExpansionTile(
                ifExpanded: widget.ifExpanded,
                title: widget.title,
              ).onTapped(onTap: widget.expandOntap).pad(EdgeInsets.only(
                  top: 15.fS, left: 21.fS, right: 21.fS, bottom: 0.fS)),
              AnimatedContainer(
                  constraints:
                      BoxConstraints(maxHeight: widget.maxHeight ?? 99.h),
                  duration: const Duration(milliseconds: 200),
                  height: widget.ifExpanded ? widget.height ?? 99.h : 0.sh,
                  child: widget.ifExpanded
                      ? Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: LightColorsPalate.chipTextColor,
                                    size: 10.fS,
                                  )),
                            ),
                            Expanded(flex: 13, child: widget.child),
                            Expanded(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: LightColorsPalate.chipTextColor,
                                    size: 10.fS,
                                  )),
                            )
                          ],
                        )
                      : null),
              10.y,
            ],
          ),
          const Divider(),
          Container(
            decoration: BoxDecoration(
              color: LightColorsPalate.backgroundColor,
              border: Border.all(color: LightColorsPalate.chipborderColor),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  11.rSA,
                ),
                bottomRight: Radius.circular(
                  11.rSA,
                ),
              ),
            ),
            child: ChipBottomBar(title: widget.subTitle),
          ),
        ],
      ),
    );
  }
}
