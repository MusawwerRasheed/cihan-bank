import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Domain/Models/card_item.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/Commons/home_dark_card.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Transactions/chihan_transfer.dart';

class HomeGrids extends StatelessWidget {
  HomeGrids({
    super.key,
    required this.isExpanded,
    required this.index,
  });

  final List<bool> isExpanded;
  final int index;
  List<CardItem> cardData = [];

  @override
  Widget build(BuildContext context) {
    cardData = [
      CardItem(
        icon: Assets.icons.internalTrnasferIcon,
        iconBackgroundColor: LightColorsPalate.purpleBlur.withOpacity(0.3),
        title: 'Internal Transfer',
        description: 'Transfer money between your personal accounts.',
        onTap: () {
          context.to(const ChihanTransfer());
        },
      ),
      CardItem(
        icon: Assets.icons.cardTransectionIcon,
        iconBackgroundColor: LightColorsPalate.redBlur.withOpacity(0.3),
        title: 'Card Transactions',
        description: 'Check all card transactions by date filter',
        onTap: () {},
      ),
      CardItem(
        icon: Assets.icons.accounSttamentIcon,
        iconBackgroundColor: LightColorsPalate.blueBlur.withOpacity(0.3),
        title: 'Account Statement',
        description: 'Check all transactions and account activities',
        onTap: () {},
      ),
      CardItem(
        icon: Assets.icons.internationalTransferIcon,
        iconBackgroundColor: LightColorsPalate.purpleBlur.withOpacity(0.3),
        title: 'International Transfer',
        description: 'Send to international account outside Iraq',
        onTap: () {},
      ),
    ];

    return SizedBox(
      height: isExpanded[index] ? 260 : 0,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 3 / 2,
        ),
        itemCount: cardData.length,
        itemBuilder: (BuildContext context, int index) {
          final item = cardData[index];
          return CustomCard(
            icon: item.icon,
            iconBackgroundColor: item.iconBackgroundColor,
            title: item.title,
            description: item.description,
            onTap: item.onTap,
          );
        },
      ),
    );
  }
}
