import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Component/detail_card_box.dart';

class CardDetailsTab extends StatelessWidget {
  const CardDetailsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DetailCardBox(
            title: "Account details",
            accountType: "Account Type",
            value: "Debit Card",
            color: LightColorsPalate.successColor),
        12.y,
        DetailCardBox(
            title: "Card Data",
            accountType: "Expire date",
            value: "april /2025",
            color: LightColorsPalate.blueBorderColor),
        12.y,
        DetailCardBox(
            title: "Payment Info",
            accountType: "Payment date",
            value: "april /2025",
            color: LightColorsPalate.blueBorderColor),
      ],
    ).padHorizontal(29.rSA);
  }
}
