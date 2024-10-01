import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class EditAccountDetails extends StatefulWidget {
  const EditAccountDetails({super.key});
  @override
  State<EditAccountDetails> createState() => _EditAccountDetailsState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _EditAccountDetailsState extends State<EditAccountDetails> {
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
                AppText(
                  "Account Details",
                  style: themeData.textTheme.bodyLarge!
                      .copyWith(color: themeData.colorScheme.onPrimaryFixed),
                ),
                11.y,
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
                SizedBox(
                  height: 1.sh,
                  width: double.infinity,
                  child: ListView.separated(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Chip(
                          label: editAccountDetailsList[index]
                              .padHorizontal(14.rSA));
                    },
                    separatorBuilder: (context, index) => 8.y,
                  ),
                )
              ],
            ).padAll(
              27.rSA,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CommonButton(
        onTap: () {},
        text: 'Update',
        horizontalMargin: 24,
      ),
    );
  }

  bool isSwitched = false;
  List<AccountDetailWidget> editAccountDetailsList = [
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
