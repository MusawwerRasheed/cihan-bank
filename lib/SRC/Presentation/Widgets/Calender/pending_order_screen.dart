import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';
import 'package:cihan_bank_mobile_banking/SRC/Domain/Models/pending_order_model.dart';
import 'package:cihan_bank_mobile_banking/SRC/Presentation/Widgets/Calender/Component/account_chip.dart';

class PendingOrderScreen extends StatefulWidget {
  const PendingOrderScreen({super.key});

  @override
  State<PendingOrderScreen> createState() => _PendingOrderScreenState();
}

class _PendingOrderScreenState extends State<PendingOrderScreen> {
  final List<PendingOrder> accountDetails = [
    PendingOrder(
        refNumber: '1234',
        implementation: 'Inner transaction',
        amount: 0.0,
        date: "2020 ,Sep ,19"),
    PendingOrder(
        refNumber: '5678',
        implementation: 'Outer transaction',
        amount: 100.0,
        date: "2025 ,Dec ,19"),
    PendingOrder(
        refNumber: '5678',
        implementation: 'Outer transaction',
        amount: 100.0,
        date: "2023 ,Jan ,19"),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.stB + 5),
              TopBar(
                actionIcon: Assets.icons.sortIcon,
                scaffoldKey: _scaffoldKey,
              ),
              30.y,
              AppText(
                'Pending orders',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 22.fS,
                ),
              ),
              10.y,
              AppTextField(
                  hintText: "Search by date",
                  controller: TextEditingController(),
                  suffixIcon: AssetImageWidget(
                    fit: BoxFit.scaleDown,
                    url: Assets.icons.calenderIcon,
                  ),
                  textInputType: TextInputType.datetime),
              13.y,
              SizedBox(
                height: 1.sh,
                child: ListView.separated(
                  shrinkWrap: false,
                  itemCount: accountDetails.length,
                  separatorBuilder: (context, index) => 13.y,
                  itemBuilder: (context, index) {
                    return AccountChip(accountDetail: accountDetails[index]);
                  },
                ),
              ),
            ],
          ).padHorizontal(23.fS)
        ],
      ),
    );
  }
}
