import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/Commons/favorite_grids_widget.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/Commons/tab_header.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/services_tab.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/transection_tab.dart';

class HomeMasterScreen extends StatefulWidget {
  const HomeMasterScreen({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<HomeMasterScreen> createState() => _HomeMasterScreenState();
}

class _HomeMasterScreenState extends State<HomeMasterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // ScrollController? customScrollController;
  bool allowScrollPhysics = true;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }
  ScrollController? controller;
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<bool> isExpanded = List.generate(1, (index) => false);
  ValueNotifier<double> height = ValueNotifier(1.sh * .7);
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return NestedScrollView(
      physics: const NeverScrollableScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) { return [

        SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          automaticallyImplyLeading: false,
          collapsedHeight: 1.stB+30,
          flexibleSpace:HomePageFrame(
            widget: widget,
            themeData: themeData,
            child: Container(
              decoration: const BoxDecoration(
                //   color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              // child:





              // DraggableScrollableSheet(
              //     minChildSize: 0.7,
              //     initialChildSize: 0.7,
              //     maxChildSize: 0.9,
              //     expand: false,
              //     builder: (context, controller) {
              //       return Stack(
              //         children: [
              //           Column(
              //             mainAxisSize: MainAxisSize.min,
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               20.y,
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: [
              //                       AssetImageWidget(
              //
              //                         url: Assets.icons.fillheartIcon,
              //                         fit: BoxFit.scaleDown,
              //                       ),
              //                       const SizedBox(width: 10),
              //                       AppText(
              //                         "Favourites",
              //                         style: themeData.textTheme.bodyLarge!.copyWith(
              //                           color: themeData.colorScheme.onPrimaryFixed,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   ExpansionArrow(
              //                     url: isExpanded.first
              //                         ? Assets.icons.arrowup
              //                         : Assets.icons.arrowDown,
              //                   ).onTapped(onTap: () {
              //                     setState(() {
              //                       isExpanded.first = !isExpanded.first;
              //                     });
              //                   }),
              //                 ],
              //               ).padHorizontal(21.fS),
              //               FavouritesGridsWidget(isExpanded: isExpanded, index: 0)
              //                   .padHorizontal(21.fS),
              //               20.y,
              //               TabHeader(
              //                   onChange: (v) {
              //                     controller.jumpTo(0);
              //                     setState(() {});
              //                   },
              //                   themeData: themeData,
              //                   tabController: _tabController),
              //             ],
              //           ),
              //           ListView(
              //             controller: controller,
              //             shrinkWrap: true,
              //             children: [
              //               if (_tabController.index == 0) const ExploreScreen(),
              //               if (_tabController.index == 1) const TransectionTab(),
              //               if (_tabController.index == 2) const ServicesTab(),
              //             ],
              //           ).pad(const EdgeInsets.only(top: 160, left: 24, right: 24))
              //
              //           // .padsymatric(21.fS, 15.fS),
              //         ],
              //       );
              //     }),
            ),
          ) ,
          expandedHeight: 1.sh/3.5,

        )

    ]; }, body:

    Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(100))),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            20.y,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AssetImageWidget(
        
                      url: Assets.icons.fillheartIcon,
                      fit: BoxFit.scaleDown,
                    ),
                    const SizedBox(width: 10),
                    AppText(
                      "Favourites",
                      style: themeData.textTheme.bodyLarge!.copyWith(
                        color: themeData.colorScheme.onPrimaryFixed,
                      ),
                    ),
                  ],
                ),
                ExpansionArrow(
                  url: isExpanded.first
                      ? Assets.icons.arrowup
                      : Assets.icons.arrowDown,
                ).onTapped(onTap: () {
                  setState(() {
                    isExpanded.first = !isExpanded.first;
                  });
                }),
              ],
            ).padHorizontal(21.fS),
            FavouritesGridsWidget(isExpanded: isExpanded, index: 0)
                .padHorizontal(21.fS),
            10.y,
            TabHeader(
                onChange: (v) {
                 // controller.jumpTo(0);
                  setState(() {});
                },
                themeData: themeData,
                tabController: _tabController),
            ListView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                if (_tabController.index == 0) const ExploreScreen(),
                if (_tabController.index == 1) const TransectionTab(),
                if (_tabController.index == 2) const ServicesTab(),
              ],
            ).padHorizontal(20)
          ],
        ),
      ),
    ),





    );
  }
}
