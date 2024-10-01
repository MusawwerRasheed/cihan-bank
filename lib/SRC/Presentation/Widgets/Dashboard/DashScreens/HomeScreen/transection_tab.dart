import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/util.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/BankingToday/Components/banking_today_tile.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/Commons/custom_chip.dart';

class TransectionTab extends StatefulWidget {
  const TransectionTab({
    super.key,
  });

  @override
  State<TransectionTab> createState() => _TransectionTabState();
}

class _TransectionTabState extends State<TransectionTab> {
  bool ifExpanded = false;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 1,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            5.y,
            CustomChip(
              expandOntap: () {
                setState(() {
                  ifExpanded = !ifExpanded;
                });
              },
              ifExpanded: ifExpanded,
              title: "Top Beneficiaries",
              subTitle: "View all transactions",
              bottomOntap: () {},
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Util.color[index],
                          radius: 67.r,
                          child: ClipOval(
                            child: AssetImageWidget(
                              url: Util.icon[index],
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        7.y,
                        AppText(Util.names[index],
                            style: themeData.textTheme.displaySmall!.copyWith(
                              color: themeData.colorScheme.onBackground,
                            ))
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 10.w,
                      ),
                  itemCount: 4),
            ),
            20.y,
            AppText(
              "History Transactions:",
              style: themeData.textTheme.bodyMedium!.copyWith(
                  fontSize: 19.fS, color: LightColorsPalate.dialogTextColor),
            ),
            7.y,
            AppText(
              maxLine: 3,
              "All transactions from all accounts, for more information check the account details",
              style: themeData.textTheme.bodySmall!
                  .copyWith(color: LightColorsPalate.tertiaryColor),
            ),
            11.y,
            ...List.generate(
                4,
                (index) => BankingTodayTile(
                        leadingText: 'fgdgdg',
                        showEnd: true,
                        endTitle: Util.endtitles[index],
                        endSubtitle: "Sep 15, 2024 12:54 PM",
                        title: Util.historyTransectionDetail[index],
                        width: 60.w,
                        color: Util.cardColor[index],
                        showIcon: true,
                        subtitle: '')
                    .padVertical(8.fS))
          ],
        );
      },
      separatorBuilder: (context, index) => 10.y,
    );
  }
}
