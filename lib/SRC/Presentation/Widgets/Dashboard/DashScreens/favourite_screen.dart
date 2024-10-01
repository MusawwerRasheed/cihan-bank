import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/util.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/Commons/custom_chip.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<bool> ifExpanded = List<bool>.filled(7, false);
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.stB + 18),
          TopBar(
            horizontalPad: 24,
            actionIcon: Assets.icons.sortIcon,
            scaffoldKey: _scaffoldKey,
          ),
          30.y,
          AppText(
            'Favorits',
            style: themeData.textTheme.bodyMedium!.copyWith(
              fontSize: 22,
            ),
          ).padHorizontal(24),
          AppText(
            "Remove from your favourite's",
            style: themeData.textTheme.bodySmall!.copyWith(fontSize: 14),
          ).padHorizontal(24),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: Util.favouriteTitle.length,
              itemBuilder: (context, outerIndex) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (outerIndex == 1)
                      AppText(
                        "Remove from your favourite's",
                        style: themeData.textTheme.bodySmall!
                            .copyWith(fontSize: 14),
                      ).padHorizontal(24),
                    CustomChip(
                            maxHeight: 0.35.sh,
                            height: 0.35.sh,
                            title: Util.favouriteTitle[outerIndex],
                            subTitle:
                                Util.favouriteChipBottomTitles[outerIndex],
                            bottomOntap: () {},
                            ifExpanded: ifExpanded[outerIndex],
                            expandOntap: () {
                              setState(() {
                                ifExpanded[outerIndex] =
                                    !ifExpanded[outerIndex];
                              });
                            },
                            child: ListView.separated(
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 3,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.rSA, vertical: 10.rSA),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.rSA)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.rSA,
                                                    vertical: 10.rSA),
                                                decoration: BoxDecoration(
                                                    color:
                                                        Util.colors[outerIndex],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.rSA)),
                                                child: AssetImageWidget(
                                                    fit: BoxFit.scaleDown,
                                                    url: Util.icons[outerIndex]
                                                        [index]),
                                              ),
                                              17.x,
                                              AppText(
                                                textAlign: TextAlign.start,
                                                Util.cardsText[outerIndex]
                                                    [index],
                                                style: themeData
                                                    .textTheme.displaySmall!
                                                    .copyWith(
                                                        color: LightColorsPalate
                                                            .greyLightColor),
                                              ),
                                            ],
                                          ),
                                          Container(
                                              height: 25.rSA,
                                              width: 25.rSA,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: outerIndex == 0
                                                      ? LightColorsPalate
                                                          .errorColor
                                                      : LightColorsPalate
                                                          .successColor,
                                                  shape: BoxShape.circle),
                                              child: Center(
                                                child: IconButton(
                                                  onPressed: () {},
                                                  color: LightColorsPalate
                                                      .arrowBackColor,
                                                  icon: Icon(outerIndex == 0
                                                      ? Icons.remove
                                                      : Icons.add),
                                                  iconSize: 10.rSA,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => 7.y,
                                itemCount: Util.icons[outerIndex].length))
                        .padHorizontal(11.fS),
                  ],
                );
              },
              separatorBuilder: (context, index) => 7.y,
            ),
          ),
        ],
      ),
    );
  }
}
