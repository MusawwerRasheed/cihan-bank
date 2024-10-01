import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class RedCard extends StatelessWidget {
  const RedCard({
    super.key,
    required this.cardNumber,
    required this.themeData,
    required this.cardHolderName,
    required this.expiryDate,
    required this.bankName,
  });

  final String cardNumber;
  final Widget bankName;
  final ThemeData themeData;
  final String cardHolderName;
  final String expiryDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 357.w,
      height: 207.h,
      padding: EdgeInsets.all(15.rSA),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bankName,
              const Spacer(),
              AssetImageWidget(url: Assets.images.visaImg.path),
            ],
          ),
          const Spacer(),
          AppText(
            cardNumber,
            style: themeData.textTheme.bodyLarge!
                .copyWith(color: themeData.colorScheme.background),
          ),
          AssetImageWidget(url: Assets.images.cardBarcodeImg.path),
          10.y,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText(
                    'Card Holder Name',
                    style: themeData.textTheme.labelSmall!
                        .copyWith(color: themeData.colorScheme.background),
                  ),
                  AppText(
                    cardHolderName,
                    style: themeData.textTheme.labelLarge!
                        .copyWith(color: themeData.colorScheme.background),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Expiry Date',
                    style: themeData.textTheme.labelSmall!
                        .copyWith(color: themeData.colorScheme.background),
                  ),
                  AppText(
                    expiryDate,
                    style: themeData.textTheme.labelLarge!
                        .copyWith(color: themeData.colorScheme.background),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
