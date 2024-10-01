import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class AccountDetails extends StatefulWidget {
  AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  AccountDetailsModel accountDetails = AccountDetailsModel(
    accountType: 'Current Account',
    currency: 'IQD',
    branch: 'Main Branch',
    iban: 'IQD12345678901234567890',
  );
  bool isSwitched = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.y,
            TopBar(
              actionIcon: Assets.icons.sortIcon,
              scaffoldKey: _scaffoldKey,
            ).padHorizontal(29),
            25.y,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      "Account Details",
                      style: themeData.textTheme.bodyLarge!.copyWith(
                          color: themeData.colorScheme.onPrimaryFixed),
                    ),
                    Row(
                      children: [
                        AppText(
                          "Edit",
                          style: themeData.textTheme.displaySmall!.copyWith(
                              color: themeData.colorScheme.onPrimaryContainer),
                        ),
                        AssetImageWidget(url: Assets.icons.editIcon),
                      ],
                    )
                  ],
                ),
                20.y,
                CreditCard(
                  cardHolderName: 'Noman Manzoor',
                  cardNumber: '**** **** **** 2345',
                  expiryDate: '02/30',
                  gred1Color: LightColorsPalate.gred2Color,
                  gred2Color: LightColorsPalate.gred2Color,
                  circleColor: LightColorsPalate.gred3Color,
                  onTap: () => context.to(const EditAccountDetails()),
                ),
                40.y,
                SwitchContainer(
                    isSwitched: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    subTitle:
                        'If you want to edit any of your data please swipe the button',
                    title: 'Account Details'),
                23.y,
                AccountInfoCard(accountDetails: accountDetails)
              ],
            ).padAll(
              27.rSA,
            ),
          ],
        ),
      ),
    );
  }

  List<AccountDetailWidget> accountDetailsList = [
    const AccountDetailWidget(title: 'Account type', value: 'Current Account'),
    const AccountDetailWidget(
      title: 'Currency',
      value: 'IQD',
      color: LightColorsPalate.successColor,
    ),
    const AccountDetailWidget(title: 'Branch', value: 'Main Branch'),
    const AccountDetailWidget(title: 'IBAN', value: 'IQD12345678901234567890'),
  ];
}
