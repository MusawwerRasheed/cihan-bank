import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/CheckServices/Component/chek_request_tab.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/CheckServices/Component/pause_check_tab.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Component/AccountBalanceTab.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Component/cancel_card.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Component/card_detail_tab.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Component/empty_screen.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Component/package_transaction.dart';

class CardServiceValueNotifiers {
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(-1);
  final ValueNotifier<int> checkServicesWidgetsIndex = ValueNotifier<int>(0);

  final List<Map<String, dynamic>> items = [
    {'text': 'Package Transactions', 'icon': Assets.icons.layersIcon},
    {'text': 'Account balance', 'icon': Assets.icons.iqdIcon},
    {'text': 'Card Details', 'icon': Assets.icons.creditCardIcon},
    {'text': 'Cancel Card', 'icon': Assets.icons.dellIcon},
  ];

  final List<String> headings = [
    "Package Transaction",
    "Account Balance",
    "Card Details",
    "Card Details"
  ];

  final List<Widget> widgetOptions = <Widget>[
    const EmptyScreen(),
    const PackageTransactionTab(),
    AccountBalanceTab(),
    const CardDetailsTab(),
    const CancelCard()
  ];

  final List<Widget> checkServicesWidgets = <Widget>[
    CheckRequestTab(),
    PauseCheckTab()
  ];

  final List<Widget> creditCards = [
    CreditCard(
        cardHolderName: 'Noman Manzoor',
        cardNumber: '**** **** **** 2345',
        expiryDate: '02/30',
        gred1Color: const Color(0xff3F3F3F),
        gred2Color: const Color(0xff3F3F3F),
        circleColor: const Color(0xff2F2C2C)),
    CreditCard(
      cardHolderName: 'Noman Manzoooor',
      cardNumber: '**** **** **** 2345',
      expiryDate: '02/30',
      gred1Color: LightColorsPalate.gred2Color,
      gred2Color: LightColorsPalate.gred2Color,
      circleColor: LightColorsPalate.gred3Color,
    ),
    CreditCard(
        cardHolderName: 'Noman Manzoor',
        cardNumber: '**** **** **** 2345',
        expiryDate: '02/30',
        gred1Color: const Color(0xff3F3F3F),
        gred2Color: const Color(0xff3F3F3F),
        circleColor: const Color(0xff2F2C2C)),
  ];

  void onItemTapped(int index) {
    selectedIndexNotifier.value = index;
  }

  void onCheckServiceTabTapped(int index) {
    checkServicesWidgetsIndex.value = index;
  }
}
