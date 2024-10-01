import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/app_rangecalender.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/TransactionDetailCalender/transaction_detail_calender.dart';

class RequestStatementScreen extends StatefulWidget {
  const RequestStatementScreen({super.key});

  @override
  State<RequestStatementScreen> createState() => _RequestStatementScreenState();
}

class _RequestStatementScreenState extends State<RequestStatementScreen> {
  int? selectedDurationIndex;
  int? selectedTypeIndex;
  int? selectedStampedType;
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
                  showRequest: false,
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
                CommonChipListWidget(
                  dataList: const ['Stamped', 'Normal'],
                  onSelect: (v) {
                    selectedStampedType = v;
                    setState(() {});
                  },
                  activeIndex: selectedStampedType,
                  spaceBetween: 0,
                ),
                20.y,
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CommonButton(
        horizontalMargin: 24,
        verticalMargin: 12,
        onTap: () {
          CommonDialogs.showCommonDialogue(
              showCloseIcon: true,
              closeIconColor: themeData.colorScheme.onBackground,
              context: context,
              iconHeight: 55,
              svgPath: Assets.icons.warningIcon,
              title: 'Authentication Code',
              description:
                  'Please enter the 4 digits authentication code sent to your mobile number',
              descriptionTextSize: 14,
              titleTextSize: 20,
              actions: [
                PinCodeWidget(),
                40.y,
                CommonButton(
                  horizontalMargin: 0,
                  verticalMargin: 0,
                  onTap: () {
                    context.back();
                    _confirmation(themeData);
                  },
                  text: 'Yes',
                ),
                10.y,
                CommonButton(
                  horizontalMargin: 0,
                  verticalMargin: 0,
                  backgroundColor: themeData.colorScheme.tertiary,
                  onTap: () {
                    context.back();
                  },
                  text: 'Cancel',
                ),
              ]);
        },
        text: 'Request Statement',
      ),
    );
  }

  _confirmation(ThemeData themeData) {
    CommonDialogs.showCustomDialogue(
        context: context,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child:
                  Icon(Icons.close, color: themeData.colorScheme.onBackground),
            ).onTapped(onTap: () {
              AppContext.navigatorKey.currentContext!.back();
            }),
            SizedBox(
              height: 80,
              width: 80,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: CircularProgressIndicator(
                      value: .8,
                      strokeWidth: 10,
                      color: themeData.colorScheme.primary,
                    ),
                  ),
                  AppText(
                    '08',
                    style: themeData.textTheme.headlineLarge!.copyWith(
                      color: themeData.colorScheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
            ),
            36.y,
            AppText(
              'PIN Code',
              style: themeData.textTheme.headlineLarge!.copyWith(
                color: themeData.colorScheme.onBackground,
                fontSize: 20,
              ),
            ),
            8.y,
            AppText(
              maxLine: 2,
              textAlign: TextAlign.center,
              'Your PIN code will be disappointing in 10 seconds ',
              style: themeData.textTheme.bodyMedium!.copyWith(
                color: themeData.colorScheme.tertiary,
                fontSize: 14,
              ),
            ),
            14.y,
            AppText(
              '2540',
              style: themeData.textTheme.headlineLarge!.copyWith(
                color: themeData.colorScheme.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            14.y,
            CommonButton(
              onTap: () {},
              text: 'Confirmed',
              horizontalMargin: 0,
              verticalMargin: 0,
            )
          ],
        ));
  }
}
