import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/util.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/Commons/home_cards.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/Commons/subexpansion_tile.dart';

class ExploreChips extends StatefulWidget {
  const ExploreChips(chipBottom,
      {super.key,
      required this.ifExpanded,
      required this.child,
      required this.indexes,
      required this.icons,
      required this.texts,
      this.subChildTap,
      required this.color,
      required this.func});

  final Function() func;
  final bool ifExpanded;
  final List<String> icons;
  final List<String> texts;

  final Widget child;
  final int indexes;
  final Color color;

  final void Function(int subIndex, String subTitle)? subChildTap;

  @override
  State<ExploreChips> createState() => _ExploreChipsState();
}

class _ExploreChipsState extends State<ExploreChips> {
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handlePrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _scrollController.animateTo(
          _currentIndex * 100.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _handleNext(int iconCount) {
    if (_currentIndex < iconCount - 1) {
      setState(() {
        _currentIndex++;
        _scrollController.animateTo(
          _currentIndex * 100.0, // assuming each item has a width of 100.0
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.fS),
      margin: EdgeInsets.symmetric(vertical: 15.fS),
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
                title: Util.titles[widget.indexes],
                ifExpanded: widget.ifExpanded,
              ).onTapped(onTap: () {
                setState(() {
                  widget.func();
                });
              }).pad(EdgeInsets.only(top: 15.fS, left: 21.fS, right: 21.fS)),
              AnimatedContainer(
                  constraints: const BoxConstraints(maxHeight: 99),
                  duration: const Duration(milliseconds: 200),
                  height: widget.ifExpanded ? 99.h : 0.sh,
                  child: widget.ifExpanded
                      ? Row(
                          children: [
                            if (widget.icons.length >= 4)
                              Expanded(
                                child: IconButton(
                                    onPressed: _handlePrevious,
                                    icon: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: LightColorsPalate.chipTextColor,
                                      size: 10.fS,
                                    )),
                              ),
                            Expanded(
                              flex: 13,
                              child: ListView.separated(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, index) {
                                    return HomeCards(
                                      text: widget.texts,
                                      icons: widget.icons,
                                      index: index,
                                      color: widget.color,
                                    ).onTapped(onTap: () {
                                      if (widget.subChildTap != null) {
                                        widget.subChildTap!(
                                          index,
                                          Util.cardsText[index][index],
                                        );
                                      }
                                    });
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                  itemCount: widget.icons.length),
                            ),
                            if (widget.icons.length >= 4)
                              Expanded(
                                child: IconButton(
                                    onPressed: () =>
                                        _handleNext(widget.icons.length),
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: LightColorsPalate.chipTextColor,
                                      size: 10.fS,
                                    )),
                              )
                          ],
                        )
                      : null),
              9.y,
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
            child: widget.child.pad(EdgeInsets.only(
              top: 9.fS,
              left: 21.fS,
            )),
          ),
        ],
      ),
    );
  }
}

class ChipBottomBar extends StatelessWidget {
  const ChipBottomBar({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title,
          style: themeData.textTheme.displaySmall!.copyWith(
              fontSize: 11.fS, color: LightColorsPalate.chipTextColor),
        ).pad(EdgeInsets.only(
          left: 21.fS,
        )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: LightColorsPalate.chipTextColor,
              size: 10.fS,
            ))
      ],
    );
  }
}
