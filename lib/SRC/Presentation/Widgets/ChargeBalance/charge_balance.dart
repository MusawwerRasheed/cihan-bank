import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/ChargeBalance/verification.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Registration/Components/drop_down_tile.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Vouchers/Components/currency_item_widget.dart';
import 'package:flutter/cupertino.dart';

class ChargeBalanceScreen extends StatefulWidget {
  const ChargeBalanceScreen({super.key});

  @override
  State<ChargeBalanceScreen> createState() => _ChargeBalanceScreenState();
}

class _ChargeBalanceScreenState extends State<ChargeBalanceScreen> {
  final currencyList = [
    {'IQD': 'IQD'},
    {'USD': 'US Dollar'},
  ];
  int selectedCardIndex = 0;
  final dummyStringList = List.generate(10, (index) => "Option $index");
  String countryCode = '+964';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.stB + 18),
          TopBar(horizontalPad: 24),
          30.y,
          AppText(
            'Charge Your Balance',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 22.fS,
            ),
          ).padHorizontal(24),
          AppText(
            'Choose Calculation form',
            style: theme.textTheme.bodySmall!.copyWith(fontSize: 14.fS),
          ).padHorizontal(24),
          30.y,
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24),
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
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.colorScheme.outline),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        'Available balance',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          AppText(
                            '17,295.22 IQD',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontSize: 37.fS,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          10.x,
                          DynamicAppIconHandler.buildIcon(
                            context: context,
                            svg: Assets.icons.viewHideIcon,
                          )
                        ],
                      ),
                      22.y,
                      Row(
                        children: [
                          AppText(
                            'Account type',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          AppText(
                            'Current accounts',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                30.y,
                CommonDropDown(
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: theme.colorScheme.onBackground,
                  ),
                  hintText: 'service provider',
                  suggestionsCallback: (str) {
                    return _searchInList(dummyStringList, str);
                  },
                  itemBuilder: (context, v) {
                    return DropDownSearchTile(val: v);
                  },
                  onSuggestionSelected: (v) {},
                  controller: TextEditingController(),
                ),
                10.y,
                CommonDropDown(
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: theme.colorScheme.onBackground,
                  ),
                  hintText: 'service type',
                  suggestionsCallback: (str) {
                    return _searchInList(dummyStringList, str);
                  },
                  itemBuilder: (context, v) {
                    return DropDownSearchTile(val: v);
                  },
                  onSuggestionSelected: (v) {},
                  controller: TextEditingController(),
                ),
                10.y,
                CommonDropDown(
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: theme.colorScheme.onBackground,
                  ),
                  hintText: 'card category',
                  suggestionsCallback: (str) {
                    return _searchInList(dummyStringList, str);
                  },
                  itemBuilder: (context, v) {
                    return DropDownSearchTile(val: v);
                  },
                  onSuggestionSelected: (v) {},
                  controller: TextEditingController(),
                ),
                10.y,
                AppTextField(
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        countryCode,
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ).onTapped(onTap: () {
                        showCountryPicker(
                            showPhoneCode: true,
                            context: context,
                            onSelect: (v) {
                              countryCode = "+${v.phoneCode}";

                              setState(() {});
                            });
                      })
                    ],
                  ).pad(const EdgeInsets.only(left: 14)),
                  hintText: 'Phone number',
                  controller: TextEditingController(),
                  enabled: true,
                  textInputType: TextInputType.number,
                ),
                100.y,
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CommonButton(
        horizontalMargin: 24,
        verticalMargin: 16,
        onTap: () {
          CommonDialogs.showCommonDialogue(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              context: context,
              svgPath: Assets.icons.warningIcon,
              title: 'Your total 1250.000 IQD\n\n\n',
              titleTextSize: 20,
              titleFontWeight: FontWeight.w500,
              actions: [
                CommonButton(
                  onTap: () {
                    context.back();
                    context.to(ChargeConfirmScreen());
                  },
                  horizontalMargin: 0,
                  text: 'Confirm',
                  verticalMargin: 0,
                ),
                CommonButton(
                  backgroundColor: theme.colorScheme.tertiary,
                  onTap: () {
                    context.back();
                  },
                  horizontalMargin: 0,
                  text: 'Cancel',
                )
              ]);
        },
        text: 'Request',
      ),
    );
  }

  List<String> _searchInList(List<String> dummyStringList, String str) {
    return dummyStringList
        .where((element) => element.toLowerCase().contains(str.toLowerCase()))
        .toList();
  }
}
