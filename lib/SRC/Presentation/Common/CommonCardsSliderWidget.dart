import 'package:carousel_slider/carousel_slider.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:dots_indicator/dots_indicator.dart';

class CommonCardSlider extends StatefulWidget {
  const CommonCardSlider({super.key});

  @override
  State<CommonCardSlider> createState() => _CommonCardSliderState();
}

class _CommonCardSliderState extends State<CommonCardSlider> {
  ValueNotifier<int> sliderIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 220.h,
              viewportFraction: 1,
              onPageChanged: (i, reason) {
                sliderIndex.value = i;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return CreditCard(
              cardHolderName: 'Noman Manzoor',
              cardNumber: '**** **** **** 2345',
              expiryDate: '02/30',
              gred1Color: LightColorsPalate.gred2Color,
              gred2Color: LightColorsPalate.gred2Color,
              circleColor: LightColorsPalate.lightGreenColor,
            );
          }).toList(),
        ),
        10.y,
        ValueListenableBuilder(
          valueListenable: sliderIndex,
          builder: (ctx, val, child) => Center(
            child: DotsIndicator(
              dotsCount: 5,
              position: val,
              decorator: DotsDecorator(
                size: const Size(6, 6),
                activeSize: const Size(6, 6),
                color: theme.colorScheme.tertiary,
                activeColor: theme.colorScheme.error,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
