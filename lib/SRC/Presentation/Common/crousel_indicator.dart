import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class CrouseIndicator extends StatelessWidget {
  const CrouseIndicator({
    super.key,
    required this.creditCards,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final List<Widget> creditCards;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: creditCards.map((card) {
        int index = creditCards.indexOf(card);
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == index
                  ? LightColorsPalate.primaryColor
                  : const Color(0xffD9D9D9)),
        );
      }).toList(),
    );
  }
}
