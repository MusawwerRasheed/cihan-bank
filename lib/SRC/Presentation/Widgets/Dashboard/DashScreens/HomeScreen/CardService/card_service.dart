import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/Extensions/extensions.dart';
import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/Extensions/responsive_extention.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/app_text.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/common_button.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/common_dialogue.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/crousal_card.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/top_bar.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/Components/app_drawer.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Component/listview_item.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Controllers/card_service_controller.dart';
import 'package:cihan_bank_mobile_banking/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CardServiceScreen extends StatefulWidget {
  const CardServiceScreen({super.key});

  @override
  State<CardServiceScreen> createState() => _CardServiceScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _CardServiceScreenState extends State<CardServiceScreen> {
  late CardServiceValueNotifiers cardServiceValueNotifiers;
  bool showBalanceHistory = false;

  final List<Map<String, String>> balanceHistory = [
    {"date": "01/01/2024", "amount": "\$1000"},
    {"date": "01/02/2024", "amount": "\$1100"},
    {"date": "01/03/2024", "amount": "\$1200"},
  ];

  @override
  void initState() {
    super.initState();
    cardServiceValueNotifiers = CardServiceValueNotifiers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.stB + 35),
            TopBar(
              horizontalPad: 24.rSA,
              actionIcon: Assets.icons.sortIcon,
              scaffoldKey: _scaffoldKey,
            ),
            25.y,
            ValueListenableBuilder<int>(
              valueListenable: cardServiceValueNotifiers.selectedIndexNotifier,
              builder: (context, selectedIndex, child) {
                final themeData = Theme.of(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      "Card Service",
                      style: themeData.textTheme.bodyLarge!.copyWith(
                          color: themeData.colorScheme.onPrimaryFixed),
                    ).padHorizontal(29.rSA),
                    AppText(
                      "Select of the following",
                      style: themeData.textTheme.bodySmall,
                    ).padHorizontal(29.rSA),
                    16.y,
                    SizedBox(
                      height: 84,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: cardServiceValueNotifiers.items.length,
                        itemBuilder: (context, index) {
                          return ListViewItem(
                            pad: const EdgeInsets.all(10),
                            text: cardServiceValueNotifiers.items[index]
                                ['text'],
                            icon: cardServiceValueNotifiers.items[index]
                                ['icon'],
                            isSelected: selectedIndex == index,
                            onTap: () {
                              setState(() {
                                cardServiceValueNotifiers.onItemTapped(index);
                                showBalanceHistory = false;
                              });
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10.w),
                      ),
                    ).padHorizontal(10.rSA),
                    16.y,
                    AppText(
                      selectedIndex == -1
                          ? ""
                          : cardServiceValueNotifiers.headings[selectedIndex],
                      style: themeData.textTheme.bodyLarge!.copyWith(
                          color: themeData.colorScheme.onPrimaryFixed),
                    ).padHorizontal(29.rSA),
                    5.y,
                    if (selectedIndex != -1)
                      showBalanceHistory && (selectedIndex == 1)
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: balanceHistory.length,
                              itemBuilder: (context, index) {
                                final balance = balanceHistory[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.rSA, vertical: 4.rSA),
                                  child: Chip(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 23.fS, vertical: 18.fS),
                                    label: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(balance["date"]!,
                                            style: TextStyle(fontSize: 16.fS)),
                                        AppText(balance["amount"]!,
                                            style: TextStyle(
                                                fontSize: 16.fS,
                                                color: Colors.green)),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : CousalCard(
                              creditCards:
                                  cardServiceValueNotifiers.creditCards),
                    if (selectedIndex != 1 || !showBalanceHistory)
                      cardServiceValueNotifiers.widgetOptions
                          .elementAt(selectedIndex + 1),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: cardServiceValueNotifiers.selectedIndexNotifier,
        builder: (context, selectedIndex, child) {
          if (selectedIndex == -1 ||
              (selectedIndex == 1 && showBalanceHistory ||
                  selectedIndex == 2)) {
            return const SizedBox.shrink();
          }

          String buttonText;
          if (selectedIndex == 0) {
            buttonText = 'Update';
          } else if (selectedIndex == 1 || selectedIndex == 2) {
            buttonText = 'Continue';
          } else if (selectedIndex == 3) {
            buttonText = 'Pause';
          } else {
            buttonText = '';
          }

          return CommonButton(
            onTap: () {
              if (selectedIndex == 1 || selectedIndex == 2) {
                setState(() {
                  showBalanceHistory = true;
                });
              }

              if (selectedIndex == 3) {
                CommonDialogs.showSuccessDialogue(
                    context: context, title: "Successful pause");
              }
            },
            text: buttonText,
            horizontalMargin: 24,
          );
        },
      ),
    );
  }
}
