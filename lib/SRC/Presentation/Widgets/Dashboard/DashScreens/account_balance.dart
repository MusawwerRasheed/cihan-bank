import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Domain/transection_model.dart';
import 'package:intl/intl.dart';

class AccountBalance extends StatefulWidget {
  const AccountBalance({super.key});

  @override
  State<AccountBalance> createState() => _AccountBalanceState();
}

class _AccountBalanceState extends State<AccountBalance> {
  final List<Transaction> transactions = [
    Transaction(
      title: 'Online Payment Adobe',
      amount: '- 20 IQD',
      date: 'Jan 15, 2024',
      isDebit: true,
    ),
    Transaction(
      title: 'Received from Rami',
      amount: '+ 60 IQD',
      date: 'Sep 15, 2024',
      isDebit: false,
    ),
    Transaction(
      title: 'Sent from Rami',
      amount: '+ 60 IQD',
      date: 'Aug 15, 2024',
      isDebit: false,
    ),
    Transaction(
      title: 'Online Payment Adobe',
      amount: '- 20 IQD',
      date: 'Sep 15, 2024',
      isDebit: true,
    ),
  ];

  late List<String> _dateList;
  late String _selectedDate;
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    _dateList = _generateDateList();
    _selectedDate = _dateList.first;
  }

  List<String> _generateDateList() {
    List<String> dates = [];
    DateTime currentDate = DateTime.now();
    DateFormat dateFormat = DateFormat('MMM dd, yyyy');
    for (int i = 0; i < 10; i++) {
      dates.add(dateFormat.format(currentDate.add(Duration(days: i))));
    }
    return dates;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      resizeToAvoidBottomInset: true,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.y,
              TopBar(
                actionIcon: Assets.icons.sortIcon,
                scaffoldKey: _scaffoldKey,
              ),
              25.y,
              AppText(
                "Account Statement",
                style: themeData.textTheme.bodyLarge!
                    .copyWith(color: themeData.colorScheme.onPrimaryFixed),
              ),
              20.y,
            ],
          ).padHorizontal(27.rSA),
          if (!isSwitched)
            Column(
              children: [
                CreditCard(
                    cardHolderName: 'Noman Manzoor',
                    cardNumber: '**** **** **** 2345',
                    expiryDate: '02/30',
                    gred1Color: LightColorsPalate.gred2Color,
                    gred2Color: LightColorsPalate.gred2Color,
                    circleColor: LightColorsPalate.gred3Color),
                23.y,
              ],
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.fS, vertical: 15.fS),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(28.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          'Account History',
                          style: themeData.textTheme.bodyLarge!.copyWith(
                            color: themeData.colorScheme.background,
                          ),
                        ).padHorizontal(10.rSA),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                          activeColor: themeData.colorScheme.onTertiary,
                        ),
                      ],
                    ),
                    AppText(
                      'You will be able to select date to view your history',
                      style: themeData.textTheme.bodySmall!
                          .copyWith(color: themeData.colorScheme.tertiary),
                    ),
                  ],
                ),
              ),
              19.y,
              if (!isSwitched)
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: TextEditingController(),
                        textInputType: TextInputType.datetime,
                        hintText: 'Start Date',
                        suffixIcon: AssetImageWidget(
                          url: Assets.icons.calenderIcon,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: AppTextField(
                        controller: TextEditingController(),
                        textInputType: TextInputType.datetime,
                        hintText: 'End Date',
                        suffixIcon: AssetImageWidget(
                          url: Assets.icons.calenderIcon,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
              if (isSwitched)
                AnimatedContainer(
                  duration: Duration(microseconds: 900),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        "Your History:",
                        style: themeData.textTheme.bodyLarge!.copyWith(
                          color: themeData.colorScheme.background,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          elevation: 0,
                          value: _selectedDate,
                          items: _dateList.map((date) {
                            return DropdownMenuItem(
                              alignment: Alignment.center,
                              value: date,
                              child: Text(
                                date,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                              ),
                            );
                          }).toList(),
                          selectedItemBuilder: (BuildContext context) {
                            return _dateList.map((date) {
                              return Text(
                                "Date",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                              ).pad(
                                EdgeInsets.only(
                                  top: 11.fS,
                                  left: 80.fS,
                                ),
                              );
                            }).toList();
                          },
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedDate = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              if (isSwitched)
                SizedBox(
                  height: 0.5.sh,
                  width: double.infinity,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      return Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFA8A8A8).withOpacity(0.15),
                              blurRadius: 20.1,
                              spreadRadius: 0,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(71),
                        ),
                        child: ListTile(
                          tileColor: themeData.colorScheme.background,
                          leading: Container(
                            height: 62,
                            width: 62,
                            decoration: BoxDecoration(
                              color: transaction.isDebit
                                  ? themeData.colorScheme.error
                                  : themeData.colorScheme.inverseSurface,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: AssetImageWidget(
                                url: index == 2
                                    ? Assets.icons.arrowUpIcon
                                    : (transaction.isDebit
                                        ? Assets.icons.adobeIcon
                                        : Assets.icons.arroowDownIcon),
                                fit: BoxFit.scaleDown,
                                height: 52,
                                width: 52,
                                color: themeData.colorScheme.background,
                              ),
                            ),
                          ),
                          title: Text(
                            transaction.title,
                            style: themeData.textTheme.bodySmall!.copyWith(
                              color: themeData.colorScheme.background,
                            ),
                          ),
                          subtitle: Text(
                            transaction.date,
                            style: themeData.textTheme.bodySmall!.copyWith(
                              color: themeData.colorScheme.tertiary,
                            ),
                          ),
                          trailing: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: transaction.amount[0],
                                  style: TextStyle(
                                    color: transaction.isDebit
                                        ? themeData.colorScheme.error
                                        : themeData.colorScheme.onTertiary,
                                    fontSize: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: transaction.amount.substring(1),
                                  style:
                                      themeData.textTheme.bodySmall!.copyWith(
                                    color: themeData.colorScheme.background,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 11),
                  ),
                ),
            ],
          ).padHorizontal(27.rSA),
        ],
      ),
      bottomNavigationBar: CommonButton(
        onTap: () {},
        text: 'Request',
        horizontalMargin: 24,
      ),
    );
  }
}
