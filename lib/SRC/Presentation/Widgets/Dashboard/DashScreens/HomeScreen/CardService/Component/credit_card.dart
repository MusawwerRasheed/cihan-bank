import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/red_creditcard.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Component/card_background_painter.dart';

class CreditCard extends StatelessWidget {
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final void Function()? onTap;

  final Color gred1Color;
  final Color gred2Color;
  final Color circleColor;

  const CreditCard({
    super.key,
    this.onTap,
    required this.gred1Color,
    required this.gred2Color,
    required this.circleColor,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    ThemeData themeData = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        size: const Size(300, 200),
        painter: CardBackgroundPainter(
          gred1Color: gred1Color,
          gred2Color: gred2Color,
          circleColor: circleColor,
        ),
        child: RedCard(
            bankName: AssetImageWidget(url: Assets.icons.iqdIcon),
            cardNumber: cardNumber,
            themeData: themeData,
            cardHolderName: cardHolderName,
            expiryDate: expiryDate),
      ),
    );
  }
}
