import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/util.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/bottom_sheet.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Resources/navigation.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Beneficery/all_benficiries.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/CardModule/allcards.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/CardModule/card_details.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Component/empty_screen.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/Commons/exploration_chip_section.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/Commons/explore_chips.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/TransactionDetailCalender/request_statement.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/TransactionDetailCalender/transaction_detail_calender.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Transactions/Components/all_transfer_services_content.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({
    super.key,
  });

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<bool> ifExpanded = List<bool>.filled(7, false);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Column(
      children: ifExpanded
          .mapIndexed((index, v) => ExploreChipSection(
 
                color: Util.colors[index],
                texts: Util.cardsText[index],
 
                func: () {
                  setState(() {
                    ifExpanded[index] = !ifExpanded[index];
                  });
                },
                subChildTap: (subInd, title) {
                  switch (index) {
                    case 0:
                      print("Account services parent");
                      handleNavigation(
                          context, subInd, (subInd) => EmptyScreen());
                      break;
                    case 1:
                      print("Card Account services parent");
                      if(subInd==0) {
                        context.to(AllCards());
                      }
                      if(subInd ==1)
                        {
                          context.to(const TransactionDetailCalender());

                        }
                      if(subInd ==2)
                      {
                        context.to(const RequestStatementScreen());

                      }
                      if(subInd ==3)
                      {
                        context.to(const CardDetails());

                      }
                      break;
                    case 2:
                      print("Transfer services parent");
                      if (subInd == 0) {
                        CustomBottomSheet().showBottomSheet(
                            context,
                            AllTransferServicesContent(
                                themeData: themeData,
                                allTransferServices: Util.allTransferServices,
                                allTransferServicesTexts:
                                    Util.allTransferServicesTexts));
                      }
                      break;
                    case 3:
                      if (subInd == 0) {
                        Navigate.to(context, AllBenficiries());
                      }
                      break;
                    default:
                      print("Cheques services parent");
                      break;
                  }
                },
                index: index,
                ifExpanded: ifExpanded[index],
                //index: index,
                icons: Util.icons[index],
                child: ChipBottomBar(title: Util.chipBottomTitles[index]),
              ))
          .toList(),
    );
  }

  void handleNavigation(
      BuildContext context, int subInd, Widget Function(int) getScreen) {
    final screen = getScreen(subInd);
    context.to(screen);
  }
}
