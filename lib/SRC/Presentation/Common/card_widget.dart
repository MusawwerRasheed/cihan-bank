import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/Extensions/extensions.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/CardModule/card_details.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/CardService/Component/credit_card.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/TransactionDetailCalender/transaction_detail_calender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
class CardSwipe extends StatefulWidget {
  const CardSwipe({super.key});
  @override
  State<CardSwipe> createState() => _CardSwipeState();
}
class _CardSwipeState extends State<CardSwipe> {
  final CardSwiperController controller = CardSwiperController();
  List<Widget> creditCardImages = [
    Image.asset(
      "assets/images/card1.png",
      fit: BoxFit.contain,
    ),
    Image.asset(
      "assets/images/card2.png",
      fit: BoxFit.contain,
    ),
    const CreditCard(
        cardHolderName: 'Noman Manzoor',
        cardNumber: '**** **** **** 2345',
        expiryDate: '02/30',
        gred1Color: Color(0xff3F3F3F),
        gred2Color: Color(0xff3F3F3F),
        circleColor: Color(0xff2F2C2C))


  ];
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.1,
      heightFactor: 0.47,
      child: CardSwiper(
        controller: controller,
        cardsCount: creditCardImages.length,
        onSwipe: _onSwipe,

        isLoop: true,
        maxAngle: 60,

        numberOfCardsDisplayed: 3,
        scale: 0.9,
        backCardOffset: const Offset(0, -30),
      //  padding: const EdgeInsets.all(24.0),
        cardBuilder: (context, index, horizontalThresholdPercentage,
            verticalThresholdPercentage) {
          print(index);
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: creditCardImages[index]
          ).onTapped(onTap: (){
            print("on tappedd");
            context.to(const CardDetails());

          });
        },
      ),
    );
  }
  bool _onSwipe(
      int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    if (direction == CardSwiperDirection.top) {
      setState(() {
        creditCardImages.shuffle(); // Shuffle the list
      });
      return true;
    }
    return false;
  }
}