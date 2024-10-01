import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Component/credit_card.dart';

class PackageTransaction extends StatelessWidget {
  const PackageTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    ThemeData themeData = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "Package transactions",
            style: themeData.textTheme.bodyLarge!
                .copyWith(color: themeData.colorScheme.onPrimaryFixed),
          ),
          CreditCard(
            cardHolderName: 'Noman Manzoor',
            cardNumber: '**** **** **** 2345',
            expiryDate: '02/30',
            gred1Color: LightColorsPalate.gred2Color,
            gred2Color: LightColorsPalate.gred2Color,
            circleColor: LightColorsPalate.gred3Color,
          ),
        ],
      ),
    );
  }
}
