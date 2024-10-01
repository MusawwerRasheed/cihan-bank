import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Vouchers/Components/currency_item_widget.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Vouchers/voucher_confirm_screen.dart';
import 'package:flutter/cupertino.dart';

class PayVoucherScreen extends StatefulWidget {
  const PayVoucherScreen({super.key});

  @override
  State<PayVoucherScreen> createState() => _PayVoucherScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _PayVoucherScreenState extends State<PayVoucherScreen> {
  final currencyList = [
    {'IQD': 'IQD'},
    {'USD': 'US Dollar'},
  ];
  int selectedCardIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
            key: _scaffoldKey,
          drawer: AppDrawer(scaffoldKey: _scaffoldKey),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
            ),
            TopBar( actionIcon: Assets.icons.sortIcon,
                scaffoldKey: _scaffoldKey,),
            18.y,
            AppText(
              'Pay your voucher',
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 22,
              ),
            ),
            AppText(
              'Select your location',
              style: theme.textTheme.bodySmall!.copyWith(
                fontSize: 12,
              ),
            ),
            30.y,
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 84,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: currencyList
                            .mapIndexed(
                              (i, e) => CurrencyItemWidget(
                                      isSelected: selectedCardIndex == i, e: e)
                                  .padHorizontal(6)
                                  .onTapped(
                                onTap: () {
                                  setState(
                                    () {
                                      selectedCardIndex = i;
                                    },
                                  );
                                },
                              ),
                            )
                            .toList()),
                  ),
                  20.y,
                  AssetImageWidget(url: Assets.images.itunes.path),
                  30.y,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                    child: Column(children: [
                      20.y,
                      ...List.generate(
                          2,
                          (index) => Row(
                                children: [
                                  AppText(
                                    index == 0
                                        ? 'Voucher Price'
                                        : 'Payment fees',
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(fontSize: 16.fS),
                                  ),
                                  const Spacer(),
                                  AppText(
                                    '00.97 USD',
                                    style: theme.textTheme.bodySmall!
                                        .copyWith(fontSize: 14.fS),
                                  ),
                                ],
                              ).pad(
                                EdgeInsets.symmetric(
                                    horizontal: 26.w, vertical: 12.h),
                              )),
                      10.y,
                      Row(
                        children: [
                          AppText(
                            'Total',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 16.fS),
                          ),
                          const Spacer(),
                          AppText(
                            '00.97 USD',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontSize: 16.fS,
                              color: LightColorsPalate.successColor,
                            ),
                          ),
                        ],
                      ).pad(
                        EdgeInsets.symmetric(horizontal: 26.w, vertical: 12.h),
                      ),
                      20.y,
                    ]),
                  ),
                  200.y,
                ],
              ),
            )
          ],
        ).padHorizontal(24),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CommonButton(
          onTap: () {
            context.to(VoucherConfirmScreen());
          },
          text: 'Confirm',
          horizontalMargin: 24,
          verticalMargin: 16,
        ),
      ),
    );
  }
}
