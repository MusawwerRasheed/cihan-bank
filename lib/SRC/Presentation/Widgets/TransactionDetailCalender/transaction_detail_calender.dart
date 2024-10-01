import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/util.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/app_rangecalender.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/BankingToday/Components/banking_today_tile.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/TransactionDetailCalender/request_statement.dart';

class TransactionDetailCalender extends StatefulWidget {
  const TransactionDetailCalender({super.key});

  @override
  State<TransactionDetailCalender> createState() =>
      _TransactionDetailCalenderState();
}

class _TransactionDetailCalenderState extends State<TransactionDetailCalender> {
  int? selectedDurationIndex;
  int? selectedTypeIndex;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 1.stB + 12),
          const TopBar().padHorizontal(24),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              children: [
                16.y,
                TransactionDetailHeader(
                  themeData: themeData,
                  showRequest: true,
                ),
                30.y,
                AppTextField(
                  textInputType: TextInputType.text,
                  hintText: 'Search',
                  prefixIcon: DynamicAppIconHandler.buildIcon(
                    context: context,
                    svg: Assets.icons.searchIcon,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                20.y,
                const AppCalender(),
                30.y,
                CommonChipListWidget(
                  dataList: const ['1 Month', '6 Month', '1 Year'],
                  onSelect: (v) {
                    selectedDurationIndex = v;
                    setState(() {});
                  },
                  activeIndex: selectedDurationIndex,
                  spaceBetween: 0,
                ),
                CommonChipListWidget(
                  dataList: const ['All', 'Credit', 'Debit'],
                  onSelect: (v) {
                    selectedTypeIndex = v;
                    setState(() {});
                  },
                  activeIndex: selectedTypeIndex,
                  spaceBetween: 0,
                ),
                20.y,
                AppText(
                  'Transaction from 22 April to 15 June',
                  style: themeData.textTheme.bodyLarge!.copyWith(
                      color: themeData.colorScheme.onPrimaryFixed,
                      fontSize: 14),
                ),
                20.y,
                ...List.generate(
                    4,
                    (index) => BankingTodayTile(
                            leadingText: 'fgdgdg',
                            showEnd: true,
                            endTitle: "20",
                            endSubtitle: "Sep 15, 2024 12:54 PM",
                            title: Util.historyTransectionDetail[index],
                            width: 60.w,
                            color: Util.cardColor[index],
                            showIcon: true,
                            subtitle: '')
                        .padVertical(8.fS))
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CommonButton(
        horizontalMargin: 24,
        verticalMargin: 12,
        onTap: () {},
        text: 'Request Statement',
      ),
    );
  }
}

class TransactionDetailHeader extends StatelessWidget {
  const TransactionDetailHeader({
    super.key,
    required this.themeData,
    required this.showRequest,
  });

  final ThemeData themeData;
  final bool showRequest;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                showRequest ? "Transactions Details" : 'Request Statement',
                style: themeData.textTheme.bodyLarge!.copyWith(
                  color: themeData.colorScheme.onPrimaryFixed,
                  fontSize: 21,
                ),
              ),
              AppText(
                showRequest
                    ? 'Last transaction date'
                    : 'Request printed statement',
                style: themeData.textTheme.bodyMedium!.copyWith(
                  color: themeData.colorScheme.tertiary,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
        if (showRequest)
          Row(
            children: [
              AppText(
                'Request',
                style: themeData.textTheme.bodyMedium!.copyWith(
                  color: LightColorsPalate.blueBorderColor,
                  fontSize: 14,
                ),
              ),
              4.x,
              const Icon(
                Icons.arrow_forward_ios,
                size: 10,
                color: LightColorsPalate.blueBorderColor,
              )
            ],
          ).onTapped(onTap: () {
            context.to(const RequestStatementScreen());
          })
      ],
    );
  }
}
