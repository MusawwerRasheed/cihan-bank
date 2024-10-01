import 'package:carousel_slider/carousel_slider.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/crousel_indicator.dart';

class CousalCard extends StatefulWidget {
  const CousalCard({
    super.key,
    required this.creditCards,
  });

  final List<Widget> creditCards;

  @override
  State<CousalCard> createState() => _CousalCardState();
}

int _currentIndex = 0;

class _CousalCardState extends State<CousalCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            // autoPlay: true,
            // aspectRatio: 12 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.creditCards,
        ),
        10.y,
        CrouseIndicator(
            creditCards: widget.creditCards, currentIndex: _currentIndex),
      ],
    );
  }
}
