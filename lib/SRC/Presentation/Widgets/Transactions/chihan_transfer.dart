import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/util.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Data/Resources/Styles/app_textstyles.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Beneficery/Components/expanded_widget.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Dashboard/DashScreens/HomeScreen/Commons/custom_chip.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Transactions/Components/select_account_block.dart';
import 'package:flutter/material.dart';

class ChihanTransfer extends StatefulWidget {
  const ChihanTransfer({Key? key}) : super(key: key);

  @override
  _ChihanTransferState createState() => _ChihanTransferState();
}

class _ChihanTransferState extends State<ChihanTransfer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ValueNotifier<String> _currencyNotifier = ValueNotifier<String>('USD');
  final ValueNotifier<String> _textFieldNotifier =
      ValueNotifier<String>('00 IQD');
       final TextEditingController bankBranch = TextEditingController();

      final List<String> _suggestions = [
    'item1',
    'item2',
    'item3',
    'item4',
    'item5',
    'item6',
    'item7',
  ];

  @override
  void dispose() {
    _currencyNotifier.dispose();
    _textFieldNotifier.dispose();
    super.dispose();
  }

  void _onCurrencyButtonPressed(String currency) {
    _currencyNotifier.value = currency;
    _textFieldNotifier.value = '00 $currency';
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(
                actionIcon: Assets.icons.sortIcon,
                scaffoldKey: _scaffoldKey,
              ).padVertical(30),
              Row(
                children: [
                  AssetImageWidget(
                    url: Assets.images.cihanBankImage.path,
                    height: 0.06.sh,
                    width: 0.06.sw,
                  ),
                  AppText(
                    'Chihan Transfer',
                    style: AppTextStyles.poppinsRegular(fontSize: 26),
                  ).pad(EdgeInsets.only(right: 80, left: 10)),
                  DynamicAppIconHandler.buildIcon(
                    context: context,
                    svg: Assets.icons.backArrowIcon,
                  ).onTapped(onTap: () {
                    // Navigator.of(context).pop();
                  }),
                ],
              ),
              AppText(
                'Fill the of following',
                style: AppTextStyles.poppinsLight(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: LightColorsPalate.greyColor,
                ),
              ).pad(EdgeInsets.only(bottom: 13)),
              AppText(
                'Select Account Transfer Form',
                style: AppTextStyles.poppinsLight(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: LightColorsPalate.homeGreyColor,
                ),
              ).pad(EdgeInsets.only(bottom: 06)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: themeData.colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    AssetImageWidget(url: Assets.icons.flagFinishIcon).pad(
                        EdgeInsets.only(
                            right: 20)), // Replace with your icon path

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Main IDQ ',
                          style: themeData.textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Current Account', // Replace with your subtitle
                          style: themeData.textTheme.bodyLarge!.copyWith(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: LightColorsPalate.greenLabel,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: AppText(
                              '12,343',
                              style: AppTextStyles.poppinsMedium(
                                  color: Colors.white),
                            ),
                          ),
                          height: 20,
                          width: 70,
                        ).pad(EdgeInsets.only(bottom: 0, left: 10, right: 30)),
                      ],
                    ),
                    AssetImageWidget(
                      url: Assets.icons.arrowIosIcon,
                    ), // Replace with your suffix icon path
                  ],
                ),
              ),
              CustomChip(
                expandOntap: () {
                  setState(() {
                    // ifExpanded = !ifExpanded;
                  });
                },
                ifExpanded: true,
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
                        AppText(
                          Util.names[index],
                          style: themeData.textTheme.displaySmall!.copyWith(
                            color: themeData.colorScheme.onBackground,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10.w),
                  itemCount: 4,
                ),
              ),
              ExpansionCustom(
                isExpansionChanged: (bool? isExpanded) {
                  setState(() {});
                },
              ),
              Row(
                children: [
                  AppText('Currency'),
                  SizedBox(width: 20),
                  _buildCurrencyButton('USD'),
                  SizedBox(width: 20),
                  _buildCurrencyButton('IQD'),
                ],
              ),
              Row(
                children: [
                  AppText('Amount'),
                  ValueListenableBuilder<String>(
                    valueListenable: _textFieldNotifier,
                    builder: (context, value, child) {
                      return Container(
                        width: 70,
                        height: 30,
                        child: TextField(
                          controller: TextEditingController(text: value),
                          decoration: InputDecoration(
                            hintText: value,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: LightColorsPalate.darkGreen),
                      borderRadius: BorderRadiusDirectional.circular(30),
                      color: LightColorsPalate.lightGreenColor,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: LightColorsPalate.darkGreen,
                          ),
                          child: AssetImageWidget(
                                  width: 3,
                                  height: 3,
                                  url: Assets.icons.chieldCheckLight)
                              .padAll(4),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 20),
                          child: AppText(
                            maxLine: 2,
                            'Transfer secured',
                            style: AppTextStyles.poppinsLight(
                                fontSize: 10,
                                color: LightColorsPalate.darkGreen),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppText('Transfer Purpose'),
              CommonDropDown(
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
                hintText: "Personal Duration",
                suggestionsCallback: _suggestionsCallback,
                itemBuilder: (BuildContext context, String suggestion) {
                  return ListTile(
                    // minTileHeight: 50,
                    //    minVerticalPadding: 0,
                    title: Text(
                      suggestion,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  );
                },
                onSuggestionSelected: (String suggestion) {
                  // privateController.text = suggestion;
                },
                controller: bankBranch,
              ),

              Container(
                height: 600, width: 400,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: LightColorsPalate.lightGreyColor)),
              )
            ],
          ).padHorizontal(25),
        ),
      ),
    );
  }

  Widget _buildCurrencyButton(String currency) {
    return ValueListenableBuilder<String>(
      valueListenable: _currencyNotifier,
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: () => _onCurrencyButtonPressed(currency),
          style: ElevatedButton.styleFrom(
              side: BorderSide(
            color: value == currency ? Colors.blue : Colors.grey,
          )),
          child: Text(currency),
        );
      },
    );
  }
 List<String> _suggestionsCallback(String query) {
    return _suggestions
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
