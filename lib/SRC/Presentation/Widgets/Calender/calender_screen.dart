import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Domain/Models/pay_bill_model.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Calender/Component/app_calender.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  PayBillModel accountDetails = PayBillModel(
      fromAccount: "969868",
      toAccount: "969868",
      date: DateTime.now(),
      amount: 2000);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.stB + 18),
          TopBar(
            horizontalPad: 24,
            scaffoldKey: _scaffoldKey,
            actionIcon: Assets.icons.sortIcon,
          ),
          30.y,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'Calendar',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 22.fS,
                ),
              ),
              AppText(
                'Last transaction date',
                style: theme.textTheme.bodySmall!.copyWith(fontSize: 14.fS),
              ),
              11.y,
              AppCalender(theme: theme),
              31.y,
              AppText(
                'Pay Bill',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 22.fS,
                ),
              ),
              10.y,
              Chip(
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AccountDetailWidget(
                      title: 'From account',
                      value: accountDetails.fromAccount,
                    ),
                    AccountDetailWidget(
                      title: 'To account',
                      value: accountDetails.toAccount,
                    ),
                    AccountDetailWidget(
                      title: 'Amount',
                      value: accountDetails.amount.toString(),
                    ),
                    AccountDetailWidget(
                        title: 'Date',
                        value: accountDetails.date.humanReadableDate),
                  ],
                ),
              )
            ],
          ).padHorizontal(23.fS),
        ],
      ),
    );
  }
}
