import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/crousal_card.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/stylish_tab.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Calender/calender_screen.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Controllers/card_service_controller.dart';

class CheckServiceScreen extends StatefulWidget {
  const CheckServiceScreen({super.key});

  @override
  State<CheckServiceScreen> createState() => _CheckServiceScreenState();
}

class _CheckServiceScreenState extends State<CheckServiceScreen> {
  late CardServiceValueNotifiers cardServiceValueNotifiers;

  @override
  void initState() {
    super.initState();
    cardServiceValueNotifiers = CardServiceValueNotifiers();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.stB + 18),
            TopBar(
              actionIcon: Assets.icons.sortIcon,
              scaffoldKey: _scaffoldKey,
            ).padHorizontal(24.rSA),
            25.y,
            AppText(
              "Card Service",
              style: themeData.textTheme.bodyLarge!
                  .copyWith(color: themeData.colorScheme.onPrimaryFixed),
            ).padHorizontal(29.rSA),
            11.y,
            StylishTab(
              themeData: themeData,
              selectedTab: (val) {
                cardServiceValueNotifiers.onCheckServiceTabTapped(val);
              },
              firstTab: 'Check Request ',
              secondTab: 'Pause Check',
            ).padHorizontal(29.rSA),
            ValueListenableBuilder<int>(
              valueListenable:
                  cardServiceValueNotifiers.checkServicesWidgetsIndex,
              builder: (context, selectedIndex, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    22.y,
                    AppText(
                      "Card Details",
                      style: themeData.textTheme.bodyLarge!.copyWith(
                          color: themeData.colorScheme.onPrimaryFixed),
                    ).padHorizontal(29.rSA),
                    11.y,
                    CousalCard(
                        creditCards: cardServiceValueNotifiers.creditCards),
                    28.y,
                    cardServiceValueNotifiers.checkServicesWidgets
                        .elementAt(selectedIndex)
                        .padHorizontal(21.rSA)
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: cardServiceValueNotifiers.checkServicesWidgetsIndex,
        builder: (context, selectedIndex, child) {
          String buttonText;
          if (selectedIndex == 1) {
            buttonText = 'Pause';
          } else {
            buttonText = 'Request'; // Default case, should not be reached
          }

          return CommonButton(
            onTap: () {
              if (selectedIndex == 0) {
                CommonDialogs.showSuccessDialogue(
                  context: context,
                  title: "Successfully Requested",
                );

                Future.delayed(Duration(seconds: 4), () {
                  context.back();

                  context.to(const CalenderScreen());
                });
              }
            },
            text: buttonText,
            horizontalMargin: 24.fS,
            verticalMargin: 20.fS,
          );
        },
      ),
    );
  }
}
