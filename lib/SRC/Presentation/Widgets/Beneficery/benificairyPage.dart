import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Domain/Models/benficaryModel.dart';
import 'package:cihan_bank_mobile_banking/SRC/Domain/Models/benificaryAccountModel.dart';
import 'package:cihan_bank_mobile_banking/SRC/Domain/Models/hostory_benficery_model.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Common/bottom_sheet.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Beneficery/Components/bank_list.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Beneficery/Components/expanded_widget.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Beneficery/Components/top_back_widget.dart';

import 'Components/benficiary_container.dart';
import 'Components/history_ben_tile.dart';

class BenficiaryIndivdualPage extends StatefulWidget {
  const BenficiaryIndivdualPage({super.key, this.widget});
  final HomeMasterScreen? widget;
  @override
  State<BenficiaryIndivdualPage> createState() =>
      _BenficiaryIndivdualPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKeyB = GlobalKey<ScaffoldState>();

class _BenficiaryIndivdualPageState extends State<BenficiaryIndivdualPage> {
  bool? isExpanded = false;
  List<HistoryBenModel> hDto = [
    HistoryBenModel(
        description:
            'Settlement Of Arrears Installments  98237540 30 From Al-Madina St. Branch',
        iconPath: Assets.icons.sideDownIcon,
        backGroundColor: LightColorsPalate.successColor,
        quantity: 20,
        time: 'Sep 15, 2024 12:54 PM'),
    HistoryBenModel(
        description:
            'Settlement Of Arrears Installments  98237540 30 From Al-Madina St. Branch',
        iconPath: Assets.icons.sideUpIcon,
        backGroundColor: LightColorsPalate.errorColor,
        quantity: 20,
        time: 'Sep 15, 2024 12:54 PM'),
    HistoryBenModel(
        description:
            'Settlement Of Arrears Installments  98237540 30 From Al-Madina St. Branch',
        iconPath: Assets.icons.sideUpIcon,
        backGroundColor: LightColorsPalate.errorColor,
        quantity: 20,
        time: 'Sep 15, 2024 12:54 PM'),
    HistoryBenModel(
        description:
            'Settlement Of Arrears Installments  98237540 30 From Al-Madina St. Branch',
        iconPath: Assets.icons.sideDownIcon,
        backGroundColor: LightColorsPalate.successColor,
        quantity: 20,
        time: 'Sep 15, 2024 12:54 PM')
  ];
  List<Benificaryaccountmodel> dto2 = [
    Benificaryaccountmodel(
        fromAccount: "Mousa Mohammed",
        toAccount: "Chian Bank",
        bankName: 'Cihan Account',
        iconPath: Assets.images.cihanBankImage.path,
        bankType: 'Cihan'),
    Benificaryaccountmodel(
        fromAccount: "Mousa Mohammed",
        toAccount: "Chian Bank",
        bankName: 'Byblos Acc-1',
        iconPath: Assets.icons.babyLosIcon,
        bankType: 'Internal'),

    Benificaryaccountmodel(
        fromAccount: "Mousa Mohammed",
        toAccount: "Chian Bank",
        bankName: 'Bank of Baghdad',
        iconPath: Assets.icons.babyLosIcon,
        bankType: 'External'),
    Benificaryaccountmodel(
        fromAccount: "Mousa Mohammed",
        toAccount: "Chian Bank",
        bankName: 'Amman',
        iconPath: Assets.icons.worldIcon,
        bankType: 'External'),
    // Benificaryaccountmodel(fromAccount: "Mousa Mohammed", toAccount: "Chian Bank",),
    // Benificaryaccountmodel(fromAccount: "Mousa Mohammed", toAccount: "Chian Bank",),
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      key: _scaffoldKeyB,
      resizeToAvoidBottomInset: false,
      drawer: AppDrawer(scaffoldKey: _scaffoldKeyB),
      body: BackRedWidget(
        scaffoldKey: _scaffoldKeyB,
        title: '',
        isSearch: false,
        topMargin: 70,
        topChild: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssetImageWidget(
              url: Assets.images.user4Img.path,
              width: 100,
              height: 100,
            ),
            AppText(
              'Sarwar Khaled',
              style: themeData.textTheme.bodyMedium
                  ?.copyWith(fontSize: 20, color: Colors.white),
            ),
            AppText(
              'Friend',
              style: themeData.textTheme.bodySmall
                  ?.copyWith(fontSize: 13, color: Colors.white),
            )
          ],
        ),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 0.67.sh,
              child: ListView(
                //  padding: EdgeInsets.zero,
                padding: const EdgeInsets.only(top: 60),
                children: [
                  AppText(
                    'Beneficiary Accounts',
                    style: themeData.textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ).padHorizontal(24),
                  AppText(
                    "You can edit the beneficiaries account and edit it please make sure you are adding the correct data to avoid unwanted loss",
                    style: themeData.textTheme.bodySmall
                        ?.copyWith(color: themeData.colorScheme.tertiary),
                    maxLine: 3,
                  ).padHorizontal(24),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    //padding: EdgeInsets.zero,

                    itemBuilder: (BuildContext context, int index) {
                      return ExpansionCustom(
                          // dto: dto[index],
                          dto2: dto2[index],
                          isExpansionChanged: (bool? val) {
                            //isExpanded = val;
                            // setState(() {});
                          },
                          isExpanded: isExpanded);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return 0.y;
                    },
                    itemCount: dto2.length,
                  ),
                  10.y,
                  Row(
                    children: [
                      AppText(
                        'History ',
                        style: themeData.textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ).padHorizontal(24),
                      const Spacer(),
                      AppText(
                        'Calender',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: themeData.colorScheme.onPrimaryContainer,
                            fontSize: 14),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: themeData.colorScheme.onPrimaryContainer,
                        size: 15.rSA,
                      ),
                      24.x
                    ],
                  ),
                  4.y,
                  AppText(
                    "All transactions from and to Sarwar, for more information check the account details.",
                    style: themeData.textTheme.bodySmall
                        ?.copyWith(color: themeData.colorScheme.tertiary),
                    maxLine: 3,
                  ).padHorizontal(24),
                  20.y,
                  ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (context, index) {
                            return HistoryTileBenficiary(dto: hDto[index]);
                          },
                          separatorBuilder: (context, index) {
                            return 10.y;
                          },
                          itemCount: hDto.length)
                      .withMargin(const EdgeInsets.only(bottom: 15)),
                ],
              ),
            )).stackIt([
          Positioned(
              //bottom: 0,
              left: 50,
              top: 270.h,
              right: 50,
              child: Align(
                child: Container(
                  width: 260,
                  height: 85,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F807E8C),
                        blurRadius: 16.80,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BenficiaryContainer(
                        title: "Add New beneficiary",
                        svgPath: Assets.icons.addBenificairIcon,
                      ).onTapped(onTap: _addNewBenf),
                      BenficiaryContainer(
                        title: "Beneficiary accounts",
                        isSelected: true,
                        svgPath: Assets.icons.accountBenificaryIcon,
                      ),
                      BenficiaryContainer(
                        isSelected: false,
                        title: "View all beneficiary",
                        svgPath: Assets.icons.viewAllIcon,
                      ),
                    ],
                  ),
                ),
              ))
        ]),
      ),
    );
  }

  void _addNewBenf() {
    CustomBottomSheet()
        .showBottomSheet(context, BenificBottomSheet(context: context));
  }
}

class BenificBottomSheet extends StatelessWidget {
  const BenificBottomSheet({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh / 2.4,
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      width: 1.sw,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.y,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey.withOpacity(0.5),
                height: 3,
                width: 50.w,
              ),
            ],
          ),
          20.y,
          AppText(
            'New Beneficiary Account',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          AppText(
            'You can edit the beneficiary account and edit it please make sure you are adding the correct data to avoid unwanted loss',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.tertiary, fontSize: 11),
            maxLine: 3,
          ),
          20.y,
          AppText(
            'Please select account location:',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.tertiary, fontSize: 13),
            maxLine: 3,
          ),
          15.y,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SheetContainer(
                  iconPath: Assets.images.cihanBankImage.path,
                  title: 'Cihan',
                  titleDesc: 'Account in Cihan Bank',
                ).onTapped(onTap: _cihanTapped),
                5.x,
                SheetContainer(
                  iconPath: Assets.icons.babyLosIcon,
                  title: 'Local',
                  titleDesc: 'Within Iraq Banks',
                ).onTapped(onTap: _localTapped),
                5.x,
                SheetContainer(
                  iconPath: Assets.icons.worldIcon,
                  title: 'International',
                  titleDesc: 'International',
                ).onTapped(onTap: _externalTapped),
              ],
            ),
          ),
          5.y,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonButton(
                onTap: () {},
                text: 'Next',
                width: 200,
                height: 36,
                textSize: 16,
              ),
            ],
          )
        ],
      ),
    );
  }

  void _cihanTapped() {
    CustomBottomSheet()
        .showDraggableSheet(context, CihanSheet(), isScroll: true);
  }

  void _localTapped() {
    CustomBottomSheet().showDraggableSheet(context, LocalSheet(),
        isScroll: true, initialChildSIze: 0.79, maxChildSIze: 0.8);
  }

  void _externalTapped() {
    CustomBottomSheet().showDraggableSheet(context, ExternalSheet(),
        isScroll: true, initialChildSIze: 0.79, maxChildSIze: 0.8);
  }
}

class CihanSheet extends StatelessWidget {
  CihanSheet({super.key});
  final TextEditingController bankField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        // height: 1.sh/2.4,
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.y,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.grey.withOpacity(0.5),
                    height: 3,
                    width: 50.w,
                  ),
                ],
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  20.y,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AssetImageWidget(url: Assets.images.cihanBankImage.path),
                      10.x,
                      AppText(
                        'New Cihan Account',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  15.y,
                  AppText(
                    'You can edit the beneficiary account and edit it please make sure you are adding the correct data to avoid unwanted loss',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 11),
                    maxLine: 3,
                  ),
                  20.y,
                  AppText(
                    'Please fill the account information',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 13),
                    maxLine: 3,
                  ),
                  15.y,
                  AppTextField(
                    textInputType: TextInputType.number,
                    controller: bankField,
                    isBank: true,
                    hintText: '0000/00000000/000/0000/000',
                    suffixWidth: 10,
                    suffixHeight: 10,
                    suffixIcon: DynamicAppIconHandler.buildIcon(
                        context: context,
                        svg: Assets.icons.qrIcon,
                        iconHeight: 15,
                        iconWidth: 15,
                        fit: BoxFit.scaleDown),
                  ),
                  5.y,
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonButton(
                    onTap: () {},
                    text: 'Confirm',
                    width: 200,
                    height: 36,
                    textSize: 16,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LocalSheet extends StatefulWidget {
  LocalSheet({super.key});

  @override
  State<LocalSheet> createState() => _LocalSheetState();
}

class _LocalSheetState extends State<LocalSheet> {
  final TextEditingController accountAlias = TextEditingController();

  final TextEditingController accountNumber = TextEditingController();

  final TextEditingController ibanNumber = TextEditingController();

  final TextEditingController accountNumberIban = TextEditingController();

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

  List<String> _suggestionsCallback(String query) {
    return _suggestions
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        // height: 1.sh/2.4,
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        width: 1.sw,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.y,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.grey.withOpacity(0.5),
                  height: 3,
                  width: 50.w,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  //  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  children: [
                    20.y,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DynamicAppIconHandler.buildIcon(
                            context: context,
                            svg: Assets.icons.babyLosIcon,
                            iconColor: Colors.black),
                        10.x,
                        AppText(
                          'New Local Account',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    15.y,
                    AppText(
                      'You can edit the beneficiary account and edit it please make sure you are adding the correct data to avoid unwanted loss',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 11),
                      maxLine: 3,
                    ),
                    20.y,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.topCenter,
                            child: AppText(
                              '*',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.error),
                            )),
                        AppText(
                          'Please fill the account information',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 13),
                          maxLine: 3,
                        ),
                      ],
                    ),
                    15.y,
                    Row(
                      children: [
                        10.x,
                        AppText(
                          'Account Alias',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 12),
                        ),

                        //const Spacer(),
                        Expanded(
                          child: Align(
                            child: SizedBox(
                              width: 180.w,
                              height: 34,
                              child: AppTextField(
                                //height: 34,

                                textInputType: TextInputType.text,
                                controller: accountAlias,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    15.y,
                    Row(
                      children: [
                        10.x,
                        AppText(
                          'Account Number',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 12),
                        ),

                        //const Spacer(),
                        Expanded(
                          child: Align(
                            child: SizedBox(
                              width: 200.w,
                              height: 34,
                              child: AppTextField(
                                //height: 34,

                                textInputType: TextInputType.text,
                                controller: accountNumber,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    30.y,
                    Row(
                      children: [
                        10.x,
                        AppText(
                          'IBAN',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 12),
                        ),
                        55.x,
                        //const Spacer(),
                        Expanded(
                          child: Align(
                            child: SizedBox(
                              width: 200.w,
                              height: 34,
                              child: AppTextField(
                                //height: 34,

                                textInputType: TextInputType.text,
                                controller: ibanNumber,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    37.y,
                    AppTextField(
                      textInputType: TextInputType.text,
                      onTap: () {
                        context.to(const BanksList());
                      },
                      readOnly: true,
                      hintText: 'To beneficiary bank',
                      suffixIcon: DynamicAppIconHandler.buildIcon(
                          context: context,
                          icon: Icons.arrow_forward_ios_sharp,
                          iconHeight: 16,
                          iconWidth: 16,
                          iconColor: Colors.grey.withOpacity(0.4)),
                      filledColor: Theme.of(context)
                          .colorScheme
                          .secondaryContainer
                          .withOpacity(0.3),
                      controller: TextEditingController(),
                    ),
                    5.y,
                    CommonDropDown(
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                      ),
                      hintText: "Bank Branch",
                      suggestionsCallback: _suggestionsCallback,
                      itemBuilder: (BuildContext context, String suggestion) {
                        return ListTile(
                          // minTileHeight: 50,
                          //    minVerticalPadding: 0,
                          title: Text(
                            suggestion,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                        );
                      },
                      onSuggestionSelected: (String suggestion) {
                        // privateController.text = suggestion;
                      },
                      controller: bankBranch,
                    ),
                    10.y,
                    AppTextField(
                      textInputType: TextInputType.number,
                      controller: accountNumberIban,
                      hintText: "Account Number \\ IBAN",
                      filledColor: Theme.of(context)
                          .colorScheme
                          .secondaryContainer
                          .withOpacity(0.3),
                    ),
                    5.y,
                  ],
                ),
              ),
            ),
            //Spacer(),
            30.y,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonButton(
                  onTap: () {},
                  text: 'Confirm',
                  width: 200,
                  height: 36,
                  textSize: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SheetContainer extends StatelessWidget {
  const SheetContainer({
    super.key,
    this.iconPath,
    this.title,
    this.titleDesc,
  });
  final String? iconPath;
  final String? title;
  final String? titleDesc;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 103,
      height: 91,
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      decoration: ShapeDecoration(
        color: const Color(0xFFF9F9F9),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFF0F0F0)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconPath!.split('.').last.contains('svg')
              ? DynamicAppIconHandler.buildIcon(
                  context: context, svg: iconPath, iconColor: Colors.black)
              : AssetImageWidget(url: Assets.images.cihanBankImage.path),
          3.y,
          AppText(
            title ?? 'Cihan',
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 13),
          ),
          AppText(
            titleDesc ?? 'Account in Cihan Bank',
            maxLine: 2,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 9, color: Theme.of(context).colorScheme.tertiary),
          )
        ],
      ),
    );
  }
}

class ExternalSheet extends StatefulWidget {
  const ExternalSheet({super.key});

  @override
  _ExternalSheetState createState() => _ExternalSheetState();
}

class _ExternalSheetState extends State<ExternalSheet> {
  final TextEditingController accountAlias = TextEditingController();

  final TextEditingController accountNumber = TextEditingController();

  final TextEditingController ibanNumber = TextEditingController();

  final TextEditingController accountNumberIban = TextEditingController();

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

  List<String> _suggestionsCallback(String query) {
    return _suggestions
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        // height: 1.sh/2.4,
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        width: 1.sw,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.y,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.grey.withOpacity(0.5),
                  height: 3,
                  width: 50.w,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  //  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  children: [
                    20.y,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DynamicAppIconHandler.buildIcon(
                            context: context,
                            svg: Assets.icons.babyLosIcon,
                            iconColor: Colors.black),
                        10.x,
                        AppText(
                          'New External Account',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    15.y,
                    AppText(
                      'You can edit the beneficiary account and edit it please make sure you are adding the correct data to avoid unwanted loss',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 11),
                      maxLine: 3,
                    ),
                    20.y,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.topCenter,
                            child: AppText(
                              '*',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.error),
                            )),
                        AppText(
                          'Please fill the account information',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 13),
                          maxLine: 3,
                        ),
                      ],
                    ),
                    15.y,
                    AppTextField(
                      textInputType: TextInputType.text,
                      onTap: () {
                        //  context.to(const BanksList());
                      },
                      readOnly: true,
                      hintText: 'Country',
                      suffixIcon: DynamicAppIconHandler.buildIcon(
                          context: context,
                          icon: Icons.arrow_forward_ios_sharp,
                          iconHeight: 16,
                          iconWidth: 16,
                          iconColor: Colors.grey.withOpacity(0.4)),
                      filledColor: Theme.of(context)
                          .colorScheme
                          .secondaryContainer
                          .withOpacity(0.3),
                      controller: TextEditingController(),
                    ),
                    20.y,
                    CommonDropDown(
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                      ),
                      hintText: "Bank Name",
                      suggestionsCallback: _suggestionsCallback,
                      itemBuilder: (BuildContext context, String suggestion) {
                        return ListTile(
                          // minTileHeight: 50,
                          //    minVerticalPadding: 0,
                          title: Text(
                            suggestion,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                        );
                      },
                      onSuggestionSelected: (String suggestion) {
                        // privateController.text = suggestion;
                      },
                      controller: bankBranch,
                    ),
                    10.y,
                    CommonDropDown(
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                      ),
                      hintText: "Clearing Code \\ Clearing number",
                      suggestionsCallback: _suggestionsCallback,
                      itemBuilder: (BuildContext context, String suggestion) {
                        return ListTile(
                          // minTileHeight: 50,
                          //    minVerticalPadding: 0,
                          title: Text(
                            suggestion,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                        );
                      },
                      onSuggestionSelected: (String suggestion) {
                        // privateController.text = suggestion;
                      },
                      controller: bankBranch,
                    ),
                    10.y,
                    AppTextField(
                      textInputType: TextInputType.number,
                      controller: TextEditingController(), isBank: true,

                      hintText: '0000/00000000/000/0000/000',
                      suffixWidth: 10,
                      suffixHeight: 10,
                      // suffixIcon: DynamicAppIconHandler.buildIcon(context: context,svg: Assets.icons.qrIcon,iconHeight: 15 ,iconWidth: 15,fit: BoxFit.scaleDown) ,
                    ),
                    AppTextField(
                      textInputType: TextInputType.number,
                      controller: TextEditingController(), isBank: false,

                      hintText: 'IBAN',
                      hintTextColor: const Color(0xFFB4B4B4),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Color(0xFFB4B4B4)),
                      suffixWidth: 10,
                      suffixHeight: 10,
                      // suffixIcon: DynamicAppIconHandler.buildIcon(context: context,svg: Assets.icons.qrIcon,iconHeight: 15 ,iconWidth: 15,fit: BoxFit.scaleDown) ,
                    ),
                    10.y,
                    Row(
                      children: [
                        10.x,
                        AppText(
                          'Beneficiary Branch',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 12),
                        ),

                        //const Spacer(),
                        Expanded(
                          child: Align(
                            child: SizedBox(
                              width: 180.w,
                              height: 34,
                              child: AppTextField(
                                //height: 34,

                                textInputType: TextInputType.text,
                                controller: accountAlias,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    15.y,
                    Row(
                      children: [
                        10.x,
                        AppText(
                          'SWIFT Code',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 12),
                        ),

                        //const Spacer(),
                        25.x,
                        Expanded(
                          child: Align(
                            child: SizedBox(
                              width: 180.w,
                              height: 34,
                              child: AppTextField(
                                //height: 34,

                                textInputType: TextInputType.text,
                                controller: accountNumber,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    30.y,
                    Row(
                      children: [
                        10.x,
                        AppText(
                          'Beneficiary address',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 12),
                        ),
                        1.x,
                        //const Spacer(),
                        Expanded(
                          child: Align(
                            child: SizedBox(
                              width: 180.w,
                              height: 34,
                              child: AppTextField(
                                //height: 34,

                                textInputType: TextInputType.text,
                                controller: ibanNumber,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //Spacer(),
            30.y,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonButton(
                  onTap: () {},
                  text: 'Confirm',
                  width: 200,
                  height: 36,
                  textSize: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
